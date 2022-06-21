import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Primeiro Horário',
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const Fake(),
      ),
      GoRoute(
        path: '/page2',
        builder: (BuildContext context, GoRouterState state) =>
            const Fake(),
      ),
    ],
  );
}

class Fake extends StatelessWidget {
  const Fake({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
