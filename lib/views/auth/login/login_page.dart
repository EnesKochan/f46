import 'package:f46/views/welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../src/app_colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signIn(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
      print('Giriş başarılı: ${userCredential.user}');
    } catch (e) {
      print('Giriş hatalı: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hata'),
            content: Text('Email ya da şifre hatalı girdiniz!'),
            actions: [
              TextButton(
                child: Text('Tamam'),
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/yazi.jpg')),
              SizedBox(height: 20),
              TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.orange,
                    ),
                    hintText: 'E-Mail',
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: Colors.orange,
                    ),
                    hintText: 'Parola',
                  )),
              SizedBox(
                height: size.height * 0.08,
              ),
              ElevatedButton(
                onPressed: () {
                  signIn(context);
                },
                child: Text('Giriş Yap', style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
