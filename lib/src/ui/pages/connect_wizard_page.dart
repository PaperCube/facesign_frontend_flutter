import 'package:facesign_frontend/src/ui/pages/management_buttons_widget.dart';

import '../ui_style.dart' as style;
import '../dialogs.dart';
import './sign_page.dart';

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class ConnectWizardPage extends ConsumerStatefulWidget {
  const ConnectWizardPage({super.key});

  @override
  ConsumerState<ConnectWizardPage> createState() => _ConnectWizardPageState();
}

class _ConnectWizardPageState extends ConsumerState<ConnectWizardPage> {
  late final _wsAddressController = TextEditingController();
  var _isLoading = false;

  void _beginConnectionToWs(String addr) async {
    try {
      setState(() {
        _isLoading = true;
      });

      final websocketFuture = WebSocket.connect(addr);
      websocketFuture.then((ws) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SignPage(baseWs: ws),
        ));
      }).catchError((error, stackTrace) {
        Dialogs.showAlertDialog(
            context, 'Connection failed', 'Failed to connect to $addr: $error');
      }).whenComplete(() {
        setState(() {
          _isLoading = false;
        });
      });
    } catch (e) {
      Dialogs.showAlertDialog(context, '$e', 'Failed to connect to $addr');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildConnectButtons() {
    return Card(
      child: UnconstrainedBox(
        child: LimitedBox(
          maxWidth: 600,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(48.0),
            child: Column(
              children: <Widget>[
                const Text('Select an option', style: style.subtitleStyle),
                style.verticalButtonSpacing,
                OutlinedButton(
                  onPressed: () => Dialogs.showNotImplementedDialog(
                      context, 'Local Backend'),
                  child: const Text('Launch Local Backend'),
                ),
                //
                const Divider(thickness: 1, height: 48),
                //
                TextField(
                  controller: _wsAddressController,
                  decoration: const InputDecoration(
                    labelText: 'WebSocket Address',
                  ),
                ),
                style.verticalButtonSpacing,
                OutlinedButton(
                  onPressed: _isLoading
                      ? null
                      : () => _beginConnectionToWs(_wsAddressController.text),
                  child: Text(_isLoading ? 'Loading' : 'Connect to Remote Backend'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const ManagementButtonsWidget(),
          _buildConnectButtons(),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}