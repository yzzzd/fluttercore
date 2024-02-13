import 'package:flutter/material.dart';
import 'package:flutter_core/core.dart';

abstract class CoreApp extends StatelessWidget {
  const CoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: initialTheme(),
      initialBinding: initialBinding(),
      home: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
        child: initialScreen()
      ),
    );
  }

  @protected
  Widget initialScreen();

  @protected
  Bindings initialBinding();

  @protected
  ThemeData initialTheme() => ThemeData(useMaterial3: true);
}
