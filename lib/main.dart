import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'example/homeApp/myapp.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //   apiKey: '',
  //   authDomain: '',
  //   projectId: '',
  //   storageBucket: '',
  //   messagingSenderId: '',
  //   appId: '',
  //   measurementId: '',
  // ));
  runApp(const MyApp());
}
