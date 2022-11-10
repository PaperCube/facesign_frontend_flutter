import 'package:facesign_frontend/src/ui/pages/authenticator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'passcode_auth_widget.dart';

import 'package:facesign_frontend/app_imports.dart';

import '../../core/datamodels/face_frame.dart';

import '../ui_style.dart' as style;

class AddNewFacePage extends ConsumerStatefulWidget {
  AddNewFacePage({super.key, required this.faceInfo});

  final FaceInfo faceInfo;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddNewFacePageState();
  }
}

class _AddNewFacePageState extends ConsumerState<AddNewFacePage>
    with BusyRunner {
  final TextEditingController _nameController = TextEditingController();

  Future<void> submit() async {
    await isardb.writeTxn(() async {
      final userObj = UserEntry(name: _nameController.text);
      final faceDescriptor = FaceDescriptor()
        ..uid = userObj.uid
        ..encodingSet = widget.faceInfo.faceEncoding!;

      await Future.wait([
        isardb.userEntrys.put(userObj),
        isardb.faceDescriptors.put(faceDescriptor),
      ]);
    });
    await Future.delayed(const Duration(milliseconds: 200));
  }

  Widget _buildBody() {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: '姓名',
          ),
        ),
        style.verticalButtonSpacingLarge,
        OutlinedButton(
          child: const Text('提交'),
          onPressed: () => runBusyFuture(submit()).then(
            (_) => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }

  Widget _buildAddNewFaceScaffold() {
    return Scaffold(
      key: const Key('AddNewFacePage'),
      appBar: AppBar(
        // title: const Text('录入新面孔'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        flexibleSpace: isBusy ? const LinearProgressIndicator() : null,
      ),
      body: Center(
        child: UnconstrainedBox(
          alignment: Alignment.center,
          child: Card(
            child: LimitedBox(
              maxWidth: 600,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(48),
                    child: _buildBody(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthenticatorWidget(
      childBuilder: () => _buildAddNewFaceScaffold(),
    ));
  }
}
