import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'example/homeApp/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyB7zYuXd8UbryfgvtM-BgkBPrtISi20iHI',
    authDomain: 'blogabogado-fc776.firebaseapp.com',
    projectId: 'blogabogado-fc776',
    storageBucket: 'blogabogado-fc776.appspot.com',
    messagingSenderId: '276349583756',
    appId: '1:276349583756:web:b38e890173335f4dddd6a9',
    measurementId: 'G-VER4XZS1JW',
  ));
 // GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(const MyApp());
}
