import 'package:facesign_frontend/src/ui/pages/authenticator_widget.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticatorWidget(
        childBuilder: () => _buildManagementScaffold(),
      )
    );
  }
}
