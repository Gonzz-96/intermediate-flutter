import 'package:flutter/material.dart';
import 'package:intermediate_flutter/src/pages/splash_page.dart';
import 'package:intermediate_flutter/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      child: MyApp(),
      create: (_) => ThemeChanger(2),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      theme: appTheme,
      home: SplashPage(),
    );
  }
}
