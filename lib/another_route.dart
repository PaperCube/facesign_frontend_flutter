import 'package:flutter/material.dart';


class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key, required this.body});

  final String body;

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Another Page'),
      ),
      body: Center(
        child: Text(widget.body),
      ),
    );
  }
}