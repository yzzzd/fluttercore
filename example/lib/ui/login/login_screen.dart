import 'package:flutter/material.dart';
import 'package:flutter_core/base/screen/core_screen.dart';
import 'package:flutter_core/core.dart';
import 'package:example/ui/login/login_view_model.dart';

class LoginScreen extends CoreScreen<LoginViewModel> {
  const LoginScreen({super.key});
  static const routeName = '/loginScreen';

  @override
  Widget buildScreen(BuildContext context) {

    final usernameController = TextEditingController(text: 'fluttercore');
    final passwordController = TextEditingController(text: '123456');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        leading: const Icon(Icons.login_outlined),
        centerTitle: false
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: usernameController,
              style: const TextStyle(fontSize: 14),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                hintText: 'Username',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))
              ),
            ),
            const Gap(16),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              textInputAction: TextInputAction.done,
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                hintText: 'Password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))
              ),
            ),
            const Gap(16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton(
                onPressed: () => viewModel.login(usernameController.text, passwordController.text),
                child: const Text('Login')
              ),
            ),
          ],
        ),
      ),
    );
  }
}
