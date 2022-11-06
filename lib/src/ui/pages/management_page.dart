import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'passcode_auth_widget.dart';

class ManagementPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ManagementPageState();
  }
}

class _ManagementPageState extends ConsumerState<ManagementPage> {
  bool _isAuthenticated = false;

  Widget _buildManagementScaffold() {
    return Scaffold(
      key: const Key('ManagementPage'),
      appBar: AppBar(
        title: const Text('管理'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(),
    );
  }

  Widget _buildAuthWidget() {
    return PasscodeAuthWidget(
      key: const Key('PasscodeAuth'),
      actionCallback: () {
        setState(() {
          _isAuthenticated = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 150),
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),
        child:
            _isAuthenticated ? _buildManagementScaffold() : _buildAuthWidget(),
      ),
    );
  }
}
