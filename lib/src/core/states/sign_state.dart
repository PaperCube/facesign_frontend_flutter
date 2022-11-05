import 'package:facesign_frontend/src/core/datamodels/user_identity.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Used for auto generation provided by 'freezed' plugin.
// Run 'flutter pub run build_runner {build|watch}' to generate code.
part 'sign_state.freezed.dart';

final globalSignState = StateNotifierProvider<SignStateNotifier, SignState>(
  (ref) => SignStateNotifier(),
);

@freezed
class SignState with _$SignState {
  const factory SignState({
    UserIdentity? userIdentity,
    @Default(false) bool hasAlreadySigned,
    DateTime? lastSigned,
  }) = _SignState;
}

class SignStateNotifier extends StateNotifier<SignState> {
  SignStateNotifier() : super(SignState());

  void replaceWith(SignState newState) {
    state = newState;
  }

  SignState update(SignState Function(SignState) fn) {
    final original = state;
    state = fn(original);
    return original;
  }
}
