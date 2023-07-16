import 'package:f46/views/auth/widgets/name_field.dart';
import 'package:f46/views/auth/widgets/password_again_field.dart';
import 'package:f46/views/auth/widgets/password_field.dart';
import 'package:f46/views/auth/widgets/surname_field.dart';
import 'package:f46/views/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../../../controller.dart';
import '../../../services/auth_service.dart';
import 'email_field.dart';

class FormRegWidget extends StatelessWidget {
  FormRegWidget({Key? key, required this.isReg}) : super(key: key);

  final dynamic _formKey = GlobalKey<FormState>();
  final bool isReg;

  AuthService _authService = AuthService();
  Controller c = Controller();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            NameField(isLogin: isReg),
            SurnameField(isLogin: isReg),
            EmailField(isLogin: isReg),
            PasswordField(isLogin: isReg),
            PassField(isLogin: isReg),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  _authService
                      .createPerson(
                          c.nameController.text,
                          c.surNameController.text,
                          c.emailController.text,
                          c.passwordController.text)
                      .then((value) {
                    return Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomeScreen()));
                  });
                },
                child: const Text('Kaydol'))
          ],
        ),
      ),
    );
  }
}
