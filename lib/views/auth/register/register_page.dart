import 'package:f46/views/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../../../services/auth_service.dart';
import '../../../src/app_colors.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

  AuthService _authService = AuthService();

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
              TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline_sharp,
                      color: Colors.orange,
                    ),
                    hintText: 'Ad',
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextField(
                  controller: _surnameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.orange,
                    ),
                    hintText: 'Soyad',
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
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
                height: size.height * 0.02,
              ),
              TextField(
                  controller: _passwordAgainController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: Colors.orange,
                    ),
                    hintText: 'Parola Tekrar',
                  )),
              SizedBox(
                height: size.height * 0.08,
              ),
              ElevatedButton(
                onPressed: () {
                  _authService
                      .createPerson(
                          _nameController.text,
                          _surnameController.text,
                          _emailController.text,
                          _passwordController.text)
                      .then((value) {
                    return Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                  });
                },
                child: Text('Kaydol', style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
