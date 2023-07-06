import 'package:f46/views/auth/register/register_page.dart';
import 'package:f46/views/welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../ui/costum_theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool rememberPassword = false;

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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 720,
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
                        'Giriş Yap',
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
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 3.0,
                                offset: Offset(0, 1),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
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
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 3.0,
                                offset: Offset(0, 1),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
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
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: AppColors.anarenk,
                        value: rememberPassword,
                        onChanged: (newValue) {
                          setState(() {
                            rememberPassword = newValue!;
                          });
                        },
                      ),
                      Text('Şifremi hatırla'),
                      SizedBox(width: 90),
                      InkWell(onTap: () {}, child: Text('Şifremi unuttum')),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        signIn(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text('Giriş Yap',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 40),
                  CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/google.png')),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: RichText(
                      text: TextSpan(
                          text: 'Bir hesabın yok mu? ',
                          style: TextStyle(
                            color: AppColors.ikincirenk,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'KAYDOL',
                              style: TextStyle(
                                  color: AppColors.anarenk,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
