import 'package:flutter/material.dart';

extension SnackBarX on State {
  void showSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }
  }
}
