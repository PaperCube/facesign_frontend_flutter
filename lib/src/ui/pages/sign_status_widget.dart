import 'dart:math';

import 'package:facesign_frontend/app_imports.dart';
import 'package:facesign_frontend/src/core/datamodels/user_identity.dart';
import 'package:facesign_frontend/src/core/states/sign_state.dart';
import 'package:facesign_frontend/src/ui/pages/add_new_face_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/states/face_frame_state.dart';
import '../../core/states/sign_state.dart';
import '../../core/datamodels/face_frame.dart';

import '../ui_style.dart' as style;

class SignStatusWidget extends ConsumerStatefulWidget {
  const SignStatusWidget({Key? key}) : super(key: key);

  @override
  _SignStatusWidgetState createState() => _SignStatusWidgetState();
}

enum _SignProcessStage {
  undefined,
  loading,
  doneSigningIn,
  doneSigningOut,
}

class _SignStatusWidgetState extends ConsumerState<SignStatusWidget>
    with BusyRunner {
  late SignState signState;
  late List<FaceInfo>? faceInfo;

  SignState? signStateInProcess;
  _SignProcessStage signProcessStage = _SignProcessStage.undefined;

  void _debugClearName() {
    ref.read(globalSignState.notifier).replaceWith(
          const SignState(userIdentity: null),
        );
  }

  Widget _buildSignInPromptWidget(String message) {
    return _largePadded(Column(
      key: const Key('_buildSignInPromptWidget'),
      children: [
        Text(
          message,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    ));
  }

  void _toAddNewFacePage(FaceInfo faceInfo) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => AddNewFacePage(faceInfo: faceInfo)));
  }

  Widget _buildNewUserWidget(BuildContext context, FaceInfo faceInfo) {
    return _largePadded(
      Column(
        key: const Key('_buildAddNewWidget'),
        children: [
          const Text(
            '不在数据库中的用户',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          style.verticalButtonSpacing,
          OutlinedButton(
            onPressed: () {
              _toAddNewFacePage(faceInfo);
            },
            child: const Text('录入新面孔'),
          ),
        ],
      ),
    );
  }

  static Future<void> _storeUpdatedFaceEncoding(
      String uid, List<double>? encoding) async {
    final userEntry = await isardb.userEntrys.getByUid(uid);
    if (userEntry == null) return;

    final faceDescriptor = await isardb.faceDescriptors.getByUid(uid);
    faceDescriptor!.addFaceEncoding(encoding ?? []);

    if (faceDescriptor.encodingLength > 10) {
      faceDescriptor.encodingSet = faceDescriptor.encodingSet!
          .sublist(faceDescriptor.encodingSet!.length - 1280);
    }

    await isardb.faceDescriptors.put(faceDescriptor);
  }

  Future<void> _userSignIn(SignState signState) async {
    setState(() {
      signStateInProcess = signState;
      signProcessStage = _SignProcessStage.loading;
    });
    final wasAlreadySigned = signState.hasAlreadySigned;
    await Future.wait([
      Future.delayed(const Duration(milliseconds: 300)),
      isardb.writeTxn(() async {
        if (!wasAlreadySigned) {
          // not signed
          final signRecord = SignRecord()
            ..uid = signState.userIdentity!.uid
            ..dateTimeSignIn = DateTime.now();
          await isardb.signRecords.put(signRecord);
        } else {
          // signed
          final signRecord = await isardb.signRecords
              .where()
              .uidEqualTo(signState.userIdentity!.uid)
              .filter()
              .dateTimeSignOutIsNull()
              .findFirst();
          signRecord!.dateTimeSignOut = DateTime.now();
          await isardb.signRecords.put(signRecord);
        }
        await _storeUpdatedFaceEncoding(
            signState.userIdentity!.uid, signState.faceInfo!.faceEncoding);
      }),
    ]);
    setState(() {
      signProcessStage = wasAlreadySigned
          ? _SignProcessStage.doneSigningOut
          : _SignProcessStage.doneSigningIn;
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        signStateInProcess = null;
        signProcessStage = _SignProcessStage.undefined;
      });
    });
  }

  Widget _buildSignProcessWidget() {
    return _largePadded(() {
      switch (signProcessStage) {
        case _SignProcessStage.loading:
          return const CircularProgressIndicator();
        case _SignProcessStage.doneSigningIn:
        case _SignProcessStage.doneSigningOut:
          return Column(
            children: [
              const Icon(Icons.task_alt_outlined, size: 36),
              style.verticalButtonSpacing,
              Text(
                signProcessStage == _SignProcessStage.doneSigningOut
                    ? '签退成功'
                    : '签到成功',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          );
        default:
          return Text('Unexpected state: ${signProcessStage.name}');
      }
    }());
  }

  Widget _buildSignStatusWidget() {
    final identity = signState.userIdentity!;
    return Stack(
      children: [
        // Containers with no children try to be as big as possible
        // unless the incoming constraints are unbounded, in which case
        // they try to be as small as possible.
        // Containers with children size themselves to their children.

        // Summary: Container tries, in order: to honor alignment,
        // to size itself to the child, to honor the width, height, and constraints,
        // to expand to fit the parent, to be as small as possible.

        // If the widget has an alignment, and the parent provides unbounded constraints,
        // then the Container tries to size itself around the child.
        // If the widget has an alignment, and the parent provides bounded constraints,
        // then the Container tries to expand to fit the parent, and then positions the child
        // within itself as per the alignment.
        Container(
          padding: const EdgeInsets.all(32),
          alignment: Alignment.center,
          child: UnconstrainedBox(
            child: Column(
              key: const Key('_buildSignStatusWidget'),
              children: <Widget>[
                Text(
                  identity.name,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Face Distance: ${signState.faceDescriptorMatch?.distance.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
                Text(
                  signState.hasAlreadySigned
                      ? '上次签到: ${signState.lastSigned!.toIso8601String()}'
                      : '未签到',
                ),
                const SizedBox(
                  height: 48,
                ),
                ElevatedButton(
                  onPressed: () => _userSignIn(signState),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        signState.hasAlreadySigned
                            ? const Icon(Icons.logout)
                            : const Icon(Icons.login),
                        Text(signState.hasAlreadySigned ? '签退' : '签到',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TextButton(
                onPressed: () => _toAddNewFacePage(signState.faceInfo!),
                child: Row(
                  children: const [Icon(Icons.help), Text('不是我？录入新面孔')],
                ),
              ),
            ))
      ],
    );
  }

  Widget _buildTest() {
    signState = ref.watch(globalSignState);
    final name = signState.userIdentity?.name;
    return Column(
      children: <Widget>[
        Text('Name: $name'),
        OutlinedButton(
          child: const Text('Randomize'),
          onPressed: () {
            ref.read(globalSignState.notifier).replaceWith(
                  SignState(
                    userIdentity:
                        UserIdentity('', Random().nextInt(1000).toString()),
                  ),
                );
          },
        ),
      ],
    );
  }

  Widget _largePadded(Widget widget) {
    return Padding(padding: const EdgeInsets.all(32), child: widget);
  }

  Widget _buildAnimatedBody(BuildContext context) {
    // signState = SignState(
    //     userIdentity: UserIdentity('sdf', 'sdfsdf'), faceInfo: FaceInfo());
    // return Container(width: double.infinity, child: _buildSignStatusWidget());
    signState = ref.watch(globalSignState);
    // print('SignState = $signState');

    if (signProcessStage != _SignProcessStage.undefined) {
      return _buildSignProcessWidget();
    }

    if (signState.multipleFace) {
      return _buildSignInPromptWidget('检测到多张面孔');
    }
    if (signState.unrecognizedFace) {
      return _buildNewUserWidget(
        context,
        signState.faceInfo!,
      );
    }

    switch (signState.userIdentity?.name) {
      case null:
        return _buildSignInPromptWidget('请在摄像头前保持面孔');
      default:
        return _buildSignStatusWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        child: UnconstrainedBox(
          constrainedAxis: Axis.horizontal,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: _buildAnimatedBody(context),
          ),
        ),
      ),
    );
  }
}
