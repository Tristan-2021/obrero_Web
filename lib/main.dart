import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nombreapp/src/clean_architecture/view/cubit/viwcubit/cubit_getdata/cubit/blog_cubit.dart';
import 'example/model/blog.dart';
import 'example/view/create_blog.dart';
import 'example/view/home_page.dart';
import 'example/view/page1.dart';
import 'example/view/read_more_blog.dart';

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
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(const MyApp());
}

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
      child: MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: 'Obrero Programador',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

final _router = GoRouter(
    debugLogDiagnostics: true,
    // initialLocation: '/',
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const HomePage(),
        ),
        routes: [
          GoRoute(
            path: 'blog/:fid',
            pageBuilder: (context, state) {
              var l = BlocProvider.of<BlogCubit>(context);

              return MaterialPage<void>(
                key: state.pageKey,
                child: FutureBuilder<Blog>(
                    future: l.lista(state.params['fid']!),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.data != null) {
                        if (snapshot.data!.id.isEmpty) {
                          return Errorpage(
                            error: state.error.toString(),
                          );
                        }
                        return ReadBlog(
                          blog: snapshot.data!,
                        );
                      }
                      return const Center(
                        child: Text('Vacío'),
                      );
                    }),
              );

              // return MaterialPage<void>(
              //   key: state.pageKey,
              //   child: FamilyPage(family: family),
              // );
            },
            routes: [
              // GoRoute(
              //   path: 'person/:pid',
              //   pageBuilder: (context, state) {
              //     final family = Families.family(state.params['fid']!);
              //     final person = family.person(state.params['pid']!);
              //     var l = BlocProvider.of<BlogCubit>(context);

              //     var blog = l.lista(state.params['pid']!);

              //     return MaterialPage<void>(
              //       key: state.pageKey,
              //       child: ReadBlog(
              //         blog: blog,
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
          GoRoute(
              name: 'about',
              path: 'about',
              pageBuilder: (context, state) =>
                  MaterialPage(key: state.pageKey, child: const Page1()))
        ],
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Errorpage(
            error: 'Weeoe${state.error.toString()}',
          ),
        ),
    redirect: (state) {});
