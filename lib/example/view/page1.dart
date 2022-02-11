import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: const ValueKey('about'));

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('página 2'),
      ),
    );
  }
}

class Errorpage extends StatelessWidget {
  final String error;
  const Errorpage({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Error 404 2'),
      ),
    );
  }
}

// sample page to show families

