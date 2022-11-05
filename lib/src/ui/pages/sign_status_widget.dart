import 'dart:math';

import 'package:facesign_frontend/src/core/datamodels/user_identity.dart';
import 'package:facesign_frontend/src/core/states/sign_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignStatusWidget extends ConsumerWidget {
  late SignState signState;

  void _debugClearName(WidgetRef ref) {
    ref.read(globalSignState.notifier).replaceWith(
          const SignState(userIdentity: null),
        );
  }

  Widget _buildSignInPromptWidget(WidgetRef ref) {
    return Column(
      key: const Key('_buildSignInPromptWidget'),
      children: [
        const Text(
          '扫描以签到',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        OutlinedButton(
          onPressed: () {
            final stateNotifier = ref.read(globalSignState.notifier);
            stateNotifier.replaceWith(
              SignState(
                userIdentity:
                    UserIdentity('', Random().nextInt(1000).toString()),
              ),
            );
          },
          child: const Text('Generate Random'),
        ),
      ],
    );
  }

  Widget _buildSignStatusWidget(WidgetRef ref) {
    final identity = signState.userIdentity!;
    return Column(
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
          'Unknown Group',
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
          onPressed: () => _debugClearName(ref),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(signState.hasAlreadySigned ? '签到' : '签退',
                style: const TextStyle(fontSize: 24)),
          ),
        ),
      ],
    );
  }

  Widget _buildTest(WidgetRef ref) {
    // final name = ref.read(globalSignState.select((value) => value.name));
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

  Widget _buildAnimatedBody(WidgetRef ref) {
    switch (signState.userIdentity?.name) {
      case null:
        return _buildSignInPromptWidget(ref);
      default:
        return _buildSignStatusWidget(ref);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    signState = ref.watch(globalSignState);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: _buildAnimatedBody(ref),
    );
  }
}
