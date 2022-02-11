import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Bienvenida extends StatelessWidget {
  const Bienvenida({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Object>(
          future: Future.delayed(const Duration(seconds: 1)),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              context.go('/family/1}');
              return const Text('bienvenido');
            }
          }),
    );
  }
}
