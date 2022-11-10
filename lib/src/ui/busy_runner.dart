import 'package:flutter/cupertino.dart';

mixin BusyRunner<T extends StatefulWidget> on State<T> {
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  Future<void> runBusyFuture(Future future, {Function? onBusy, Function? onError}) async {
    if (_isBusy) return;
    setState(() {
      _isBusy = true;
      onBusy?.call();
    });
    try {
      await future;
    } catch (e) {
      onError?.call(e);
    } finally {
      setState(() {
        _isBusy = false;
      });
    }
  }
}
