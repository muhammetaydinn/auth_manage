import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/auth_manager.dart';
import 'splash/splash_view.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider<AuthManager>(
      create: (context) => AuthManager(context: context),
    ),
  ], child:  MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  SplashView(),
    );
  }
}
