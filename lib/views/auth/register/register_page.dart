import 'package:f46/views/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../../../services/auth_service.dart';
import '../../../ui/costum_theme.dart';
import '../../../ui/decoration.dart';

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

  bool _obscureText = true;

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/pana.png')),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Kayıt Ol',
                      style: TextStyle(
                        color: AppColors.ikincirenk,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  decoration: CustomBoxDecoration.getDecoration(),
                  child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline_sharp,
                          color: Colors.orange,
                        ),
                        hintText: 'Ad',
                      )),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  decoration: CustomBoxDecoration.getDecoration(),
                  child: TextField(
                      controller: _surnameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.orange,
                        ),
                        hintText: 'Soyad',
                      )),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  decoration: CustomBoxDecoration.getDecoration(),
                  child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.orange,
                        ),
                        hintText: 'E-Mail',
                      )),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  decoration: CustomBoxDecoration.getDecoration(),
                  child: TextField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            color: AppColors.anarenk,
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.orange,
                        ),
                        hintText: 'Parola',
                      )),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
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
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child:
                        Text('Kaydol', style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
