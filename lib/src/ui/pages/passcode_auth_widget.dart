import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasscodeAuthWidget extends ConsumerStatefulWidget {
  PasscodeAuthWidget({super.key, this.actionCallback, this.cancelCallback});

  final void Function()? actionCallback;
  final void Function()? cancelCallback;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PasscodeAuthWidgetState();
  }
}

class _PasscodeAuthWidgetState extends ConsumerState<PasscodeAuthWidget> {
  late final _passcodeController = TextEditingController();
  bool _isPasscodeInvalid = false;
  final _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.requestFocus();
    _passcodeController
        .addListener(() => setState(() => _isPasscodeInvalid = false));
    super.initState();
  }

  void _performAuthentication() {
    if (_passcodeController.text == '1234') {
      widget.actionCallback?.call();
    } else {
      setState(() {
        _isPasscodeInvalid = true;
      });
    }
  }

  Widget _buildNumeralKeypad() {
    return NumeralKeypad(
      textEditingController: _passcodeController,
      transferFocusNodeTo: _focusNode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              widget.cancelCallback?.call();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        Center(
          child: UnconstrainedBox(
            child: LimitedBox(
              maxWidth: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('验证你的身份'),
                  const SizedBox(height: 12),
                  TextField(
                    focusNode: _focusNode,
                    controller: _passcodeController,
                    obscureText: true,
                    onSubmitted: (_) => _performAuthentication(),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: '管理口令',
                      errorText: _isPasscodeInvalid ? '口令错误' : null,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      _performAuthentication();
                    },
                    child: const Text('验证'),
                  ),
                  const SizedBox(height: 24),
                  _buildNumeralKeypad(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NumeralKeypad extends StatelessWidget {
  const NumeralKeypad({
    super.key,
    this.onPressed,
    this.textEditingController,
    FocusNode? transferFocusNodeTo,
  }) : _transferFocusNodeTo = transferFocusNodeTo;

  final void Function(int)? onPressed;
  final TextEditingController? textEditingController;
  final FocusNode? _transferFocusNodeTo;

  Widget _buildGrids() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      children: [
        ...List.generate(11, (index) {
          return index == 9
              ? Container()
              : TextButton(
                  onPressed: () {
                    onPressed?.call(index == 10 ? 0 : index + 1);
                    if (textEditingController != null) {
                      final ctl = textEditingController!;
                      final selection = ctl.selection;
                      ctl.text = ctl.text.replaceRange(selection.start,
                          selection.end, (index + 1).toString());
                      ctl.selection = TextSelection.fromPosition(
                          TextPosition(offset: selection.start + 1));
                    }

                    _transferFocusNodeTo?.requestFocus();
                  },
                  child: Text(
                    (index == 10 ? 0 : index + 1).toString(),
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                );
        }),
        InkWell(
          onTap: () {
            onPressed?.call(-1);
            if (textEditingController != null) {
              final ctl = textEditingController!;
              if (ctl.text.isEmpty) return;
              final selection = ctl.selection;
              ctl.text =
                  ctl.text.replaceRange(selection.start - 1, selection.end, '');
              ctl.selection = TextSelection.fromPosition(
                  TextPosition(offset: selection.start - 1));

              _transferFocusNodeTo?.requestFocus();
            }
          },
          onLongPress: () {
            textEditingController!.clear();
          },
          child: const Icon(Icons.backspace),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 300),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        childAspectRatio: 1.5,
        children: [
          ...List.generate(11, (index) {
            return index == 9
                ? Container()
                : InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      onPressed?.call(index == 10 ? 0 : index + 1);
                      if (textEditingController != null) {
                        final ctl = textEditingController!;
                        final selection = ctl.selection;
                        ctl.text = ctl.text.replaceRange(selection.start,
                            selection.end, (index + 1).toString());
                        ctl.selection = TextSelection.fromPosition(
                            TextPosition(offset: selection.start + 1));
                      }

                      _transferFocusNodeTo?.requestFocus();
                    },
                    child: Center(
                      child: Text(
                        (index == 10 ? 0 : index + 1).toString(),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ));
          }),
          InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              onPressed?.call(-1);
              if (textEditingController != null) {
                final ctl = textEditingController!;
                if (ctl.text.isEmpty) return;
                final selection = ctl.selection;
                ctl.text = ctl.text
                    .replaceRange(selection.start - 1, selection.end, '');
                ctl.selection = TextSelection.fromPosition(
                    TextPosition(offset: selection.start - 1));

                _transferFocusNodeTo?.requestFocus();
              }
            },
            onLongPress: () {
              textEditingController!.clear();
            },
            child: const Icon(Icons.backspace),
          ),
        ],
      ),
    );
  }
}
