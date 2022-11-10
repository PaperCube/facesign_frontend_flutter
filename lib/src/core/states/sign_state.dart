import 'package:facesign_frontend/src/core/datamodels/face_frame.dart';
import 'package:facesign_frontend/src/core/datamodels/user_identity.dart';
import 'package:facesign_frontend/src/core/db/isar_db.dart';
import 'package:facesign_frontend/src/core/states/face_frame_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../recognizer/recognizer_util.dart';

// Used for auto generation provided by 'freezed' plugin.
// Run 'flutter pub run build_runner {build|watch}' to generate code.
part 'sign_state.freezed.dart';

@immutable
@freezed
class SignState with _$SignState {
  const factory SignState({
    @Default(false) bool unrecognizedFace,
    @Default(false) bool multipleFace,
    UserIdentity? userIdentity,
    @Default(false) bool hasAlreadySigned,
    DateTime? lastSigned,
    FaceInfo? faceInfo,
    FaceDescriptorMatch? faceDescriptorMatch,
  }) = _SignState;
}

class SignStateNotifier extends StateNotifier<SignState> {
  SignStateNotifier() : super(const SignState());

  void replaceWith(SignState newState) {
    state = newState;
  }

  SignState update(SignState Function(SignState) fn) {
    final original = state;
    state = fn(original);
    return original;
  }

  Future<void> queryFaceAndUpdateAsync(FaceInfo info) async {
    final List<FaceDescriptor> faceDescriptorList =
        await isardb.faceDescriptors.where().findAll();
    final List<FaceDescriptorMatch> matchResult =
        await RecognizerUtil.compareFacesAsync(
            faceDescriptorList, info.faceEncoding!);
    if (matchResult.isEmpty) {
      state = SignState(
        unrecognizedFace: true,
        faceInfo: info,
      );
    } else {
      final best = matchResult.first;

      final UserEntry userEntry =
          (await isardb.userEntrys.where().uidEqualTo(best.faceDescriptor.uid).findFirst())!;
        
      final SignRecord? latestSign = await isardb.signRecords.where().uidEqualTo(userEntry.uid).sortByDateTimeSignInDesc().findFirst();

      state = SignState(
        userIdentity: UserIdentity(userEntry.uid!, userEntry.name!),
        hasAlreadySigned: latestSign == null ? false : latestSign.dateTimeSignOut == null,
        lastSigned: latestSign?.dateTimeSignIn,
        faceInfo: info,
        faceDescriptorMatch: best,
      );
    }
  }

  void reportDetectionOfMultipleFaces() {
    state = const SignState(multipleFace: true);
  }
}

final globalSignState = StateNotifierProvider<SignStateNotifier, SignState>(
  (ref) {
    final signState = SignStateNotifier();
    ref.listen(
      faceFrameStateProvider.select((aValue) => aValue.value?.faceInfo),
      (previous, next) async {
        // print('next = $next');
        if (next != null) {
          if (next.length == 1) {
            await signState.queryFaceAndUpdateAsync(next[0]);
          } else if (next.length > 1) {
            signState.reportDetectionOfMultipleFaces();
          } else {
            signState.replaceWith(const SignState());
          }
        }
      },
    );
    return signState;
  },
);

// final _globalSignState = Provider<SignState>((ref) {
//   final faceInfo = ref
//       .watch(faceFrameStateProvider.select((aValue) => aValue.value?.faceInfo));
//   return SignState();
// });
