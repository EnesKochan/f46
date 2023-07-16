import 'package:f46/controller.dart';
import 'package:f46/views/auth/widgets/password_field.dart';
import 'package:f46/views/welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../services/auth_service.dart';
import '../../../ui/costum_theme.dart';
import 'email_field.dart';

class FormWidget extends StatelessWidget {
  FormWidget({Key? key, required this.isLogin}) : super(key: key);

  EmailField e = EmailField(isLogin: true);
  PasswordField p = PasswordField(isLogin: true);
  final dynamic _formKey = GlobalKey<FormState>();
  final bool isLogin;
  AuthService _authService = AuthService();
  Controller c = Controller();

  Future<void> signIn(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: e.cont.emailController.text,
              password: p.cont.passwordController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
      print('Giriş başarılı: ${userCredential.user}');
    } catch (e) {
      print('Giriş hatalı: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Hata'),
            content: const Text('Email ya da şifre hatalı girdiniz!'),
            actions: [
              TextButton(
                child: const Text('Tamam'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            EmailField(isLogin: isLogin),
            PasswordField(isLogin: isLogin),
            const SizedBox(height: 20),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  'Şifremi hatırla',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                const SizedBox(width: 85),
                Text(
                  'Şifremi unuttum',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                signIn(context);
              },
              child: const Text(
                'Giriş Yap',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
