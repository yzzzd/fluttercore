import 'package:flutter/material.dart';
import 'package:flutter_core/core.dart';

abstract class CoreApp2 extends StatelessWidget {
  const CoreApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: initialTheme(),
      initialBinding: initialBinding(),
      getPages: getPages(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
          child: child!
        );
      },
      home: initialScreen(),
    );
  }

  @protected
  Widget initialScreen();

  @protected
  Bindings initialBinding();

  @protected
  List<GetPage> getPages();

  @protected
  ThemeData initialTheme() => ThemeData(useMaterial3: true);
}
