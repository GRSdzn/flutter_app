import 'package:flutter/material.dart';
import 'package:flutter_app_learn_dart/router/router.dart';
import 'package:flutter_app_learn_dart/theme/theme.dart';

class CryptoCurrienciesListApp extends StatelessWidget {
  const CryptoCurrienciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      routes: routes,
    );
  }
}
