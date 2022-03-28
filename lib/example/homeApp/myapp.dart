import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nombreapp/example/model/blog.dart';
import 'package:nombreapp/example/view/home_page.dart';
import 'package:nombreapp/example/view/read_more_blog.dart';
import 'package:nombreapp/src/clean_architecture/view/cubit/viwcubit/cubit_getdata/cubit/blog_cubit.dart';

import '../view/create_blog.dart';
import '../view/page1.dart';

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
        debugShowCheckedModeBanner: false,
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
  urlPathStrategy: UrlPathStrategy.hash,
  debugLogDiagnostics: true,
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
                      child:
                          FittedBox(child: Text('Estamos realizando cambios')),
                    );
                  }),
            );
          },
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
);
