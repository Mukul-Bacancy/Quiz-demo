import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_demo/src/feature/home/views/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: FlexColorScheme.light(scheme: FlexScheme.blumineBlue).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.blumineBlue).toTheme,
      home: HomePage(),
    );
  }
}
