import 'package:facesign_frontend/app_imports.dart';
import 'package:facesign_frontend/src/ui/pages/authenticator_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'passcode_auth_widget.dart';

import 'package:facesign_frontend/app_imports.dart';

import 'dart:io';
import 'package:facesign_frontend/src/ui/ui_style.dart' as style;

class ManagementPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ManagementPageState();
  }
}

class _ManagementPageState extends ConsumerState<ManagementPage>
    with BusyRunner {
  Widget _inkwellListTile(
    String title, {
    String? subtitle,
    void Function()? onTap,
    bool enabled = true,
  }) {
    return InkWell(
      onTap: enabled ? onTap : null,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        alignment: Alignment.centerLeft,
        child: UnconstrainedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Future<void> _exportRecords() async {
    await Future.delayed(Duration(milliseconds: 100));
    final result = await FilePicker.platform.saveFile(
      dialogTitle: '保存签到记录到...',
      fileName: 'facesign_records.csv',
    );
    if (result != null) {
      final file = File(result);
      await file
          .writeAsString(await DataExporter.exportTodayAsString(withBom: true));

      if (mounted) {
        showSnackBar('已保存到 ${file.path}');
      }
    } else {
      showSnackBar('已取消');
    }
  }

  Widget _buildList() {
    return ListView(
      children: <Widget>[
        const SizedBox(height: 16),
        _sectionTitle('数据'),
        _inkwellListTile(
          '导出今日签到记录',
          onTap: () => runBusyFuture(_exportRecords()),
        ),
      ],
    );
  }

  Widget _buildManagementScaffold() {
    return Scaffold(
      key: const Key('ManagementPage'),
      appBar: AppBar(
        title: const Text('管理'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        flexibleSpace: isBusy ? const LinearProgressIndicator() : null,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          width: 600,
          child: Card(child: _buildList()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthenticatorWidget(
      childBuilder: () => _buildManagementScaffold(),
    ));
  }
}
