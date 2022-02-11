import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nombreapp/ingore.dart';
import 'package:nombreapp/src/clean_architecture/view/cubit/viwcubit/cubit_getdata/cubit/blog_cubit.dart';
import 'example/homeApp/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseInitial.initialFirebase();
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(const MyApp());
}
