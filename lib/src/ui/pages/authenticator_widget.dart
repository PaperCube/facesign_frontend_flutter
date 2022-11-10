import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'passcode_auth_widget.dart';

class AuthenticatorWidget extends ConsumerStatefulWidget {
  const AuthenticatorWidget({
    Key? key,
    this.childBuilder,
    // this.beforeAuthenticated,
    this.autoAuthKey = 'default',
  }) : super(key: key);

  final String autoAuthKey;
  final Widget Function()? childBuilder;
  // final void Function()? beforeAuthenticated;

  @override
  ConsumerState<AuthenticatorWidget> createState() {
    return _AuthenticatorWidgetState();
  }
}


final _authenticatorState = StateProvider.family<int, String>((ref, id) => 0);

class _AuthenticatorWidgetState extends ConsumerState<AuthenticatorWidget>
    with RouteAware {
  bool _isAuthenticatedByCurrentWidget = false;

  late final StateController<int> _authStateNotifier;

  Widget _buildAuthWidget() {
    return PasscodeAuthWidget(
      key: const Key('PasscodeAuth'),
      actionCallback: () {
        _authStateNotifier.update((x) => x + 1);
        _isAuthenticatedByCurrentWidget = true;
      },
    );
  }

  @override
  void didChangeDependencies() {
    _authStateNotifier =
        ref.read(_authenticatorState(widget.autoAuthKey).notifier);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = ref.watch(_authenticatorState(widget.autoAuthKey));
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      child: isAuthenticated > 0
          ? widget.childBuilder?.call()
          : _buildAuthWidget(),
    );
  }

  @override
  void dispose() {
    if (_isAuthenticatedByCurrentWidget) {
      Future(() {
        _authStateNotifier.update((x) => x - 1);
      });
    }
    super.dispose();
  }
}
