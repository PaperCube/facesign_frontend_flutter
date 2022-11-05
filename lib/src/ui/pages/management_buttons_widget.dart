import '../ui_style.dart' as style;

import 'package:flutter/material.dart';

class ManagementButtonsWidget extends StatelessWidget {
  const ManagementButtonsWidget({
    super.key,
    this.prependingWidgets = const [],
    this.appendingWidgets = const [],
  });

  final List<Widget> prependingWidgets;
  final List<Widget> appendingWidgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: UnconstrainedBox(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
          child: Row(
            children: [
              ...prependingWidgets,
              OutlinedButton(
                onPressed: () {},
                child: const Text('管理'),
              ),
              style.horizontalButtonSpacing,
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
              ...appendingWidgets,
            ],
          ),
        ),
      ),
    );
  }
}
