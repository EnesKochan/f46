import 'package:f46/views/auth/login/login_page.dart';
import 'package:f46/views/auth/register/register_page.dart';
import 'package:flutter/material.dart';

import '../../../src/app_strings.dart';
import '../../ui/costum_theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () => _goToLogin(context),
            child: const Text(
              AppStrings.login,
              style: TextStyle(color: AppColors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () => _goToRegister(context),
            child: const Text(
              AppStrings.register,
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ],
      ),
    ));
  }

  void _goToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  void _goToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
