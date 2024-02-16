import 'package:flutter/material.dart';
import 'package:flutter_core/base/screen/core_screen.dart';
import 'package:flutter_core/widget/collect/collect.dart';
import 'package:example/ui/welcome/welcome_view_model.dart';

class WelcomeScreen extends CoreScreen<WelcomeViewModel> {
  const WelcomeScreen({super.key});
  
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  width: 48,
                  height: 6,
                  color: Colors.amber,
                ),
                const Text('ƒluttercore²ßeta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
              ]
            ),
            Collect(() => Text(viewModel.lastOpen.value, style: const TextStyle(fontSize: 10)))
          ],
        ),
      ),
    );
  }
}