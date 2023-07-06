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
          Image.asset('assets/pana.png'),
          SizedBox(height: 100),
          Center(
            child: RichText(
              text: TextSpan(
                  text: 'Yeni yerler mi keşfetmek istiyorsun?\n O zaman ',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.ikincirenk,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'TRAVELLY',
                      style: TextStyle(
                          color: AppColors.anarenk,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' ile tam zamanı!',
                      style: TextStyle(
                          color: AppColors.ikincirenk,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
          ),
          SizedBox(height: 100),
          Container(
            width: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () => _goToLogin(context),
              child: const Text(
                AppStrings.login,
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: RichText(
              text: TextSpan(
                  text: 'Giriş yapmadan ',
                  style: TextStyle(
                      color: AppColors.ikincirenk, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'devam et',
                      style: TextStyle(
                          color: AppColors.anarenk,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
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
