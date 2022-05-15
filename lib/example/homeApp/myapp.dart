import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nombreapp/example/view/home_page.dart';

import '../cubit/blog_cubit.dart';
import '../utils/colors.dart';




class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlogCubit()..getData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
    
        title: 'Obrero Programador',
        home: const HomePage(key: Key('únic')),
        theme: ThemeData(
          secondaryHeaderColor: colorsbackground,
          scaffoldBackgroundColor: colorsbackground,
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

