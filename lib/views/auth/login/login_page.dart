import 'package:f46/views/auth/register/register_page.dart';
import 'package:f46/views/welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../services/auth_service.dart';
import '../../../ui/costum_input.dart';
import '../../../ui/costum_theme.dart';
import '../../home/home_screen.dart';

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
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
             child: Column(
                  children: [
                    Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Image(image: AssetImage('assets/pana.png')),
                          Lottie.network(
                          'https://assets1.lottiefiles.com/packages/lf20_AYgNPVAQgf.json', reverse: true, ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                'Giriş Yap',
                                style: context.h4?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: Column(
                              children: [
                                TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      focusedBorder: CostumInput.Focus,
                                      enabledBorder: CostumInput.Enabled,
                                      filled: true,
                                      fillColor: AppColors.beyaz,
                                      prefixIcon: const Icon(
                                        Icons.mail,
                                        color: Colors.orange,
                                      ),
                                      labelText: 'E-mail',
                                      floatingLabelStyle: context.h5?.copyWith(color: AppColors.anarenk, fontWeight: FontWeight.w800),
                                      labelStyle: context.paragraph?.copyWith(color: AppColors.koyugri),
                                    )),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                TextField(
                                    controller: _passwordController,
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      focusedBorder: CostumInput.Focus,
                                      enabledBorder: CostumInput.Enabled,
                                      filled: true,
                                      fillColor: AppColors.beyaz,
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
                                      prefixIcon: const Icon(
                                        Icons.vpn_key,
                                        color: Colors.orange,
                                      ),
                                      labelText: 'Parola',
                                      labelStyle: context.paragraph?.copyWith(color: AppColors.koyugri),
                                      floatingLabelStyle: context.h5?.copyWith(color: AppColors.anarenk, fontWeight: FontWeight.w800),
                                      
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: AppColors.beyaz,
                                    activeColor: AppColors.anarenk,
                                    value: rememberPassword,
                                    onChanged: (newValue) {
                                      setState(() {
                                        rememberPassword = newValue!;
                                      });
                                    },
                                  ),
                                  Text('Şifremi hatırla'),
                                ],
                              ),
                              SizedBox(width: 90),
                              InkWell(onTap: () {}, child: 
                                  Text('Şifremi unuttum', style: context.paragraph?.copyWith(color: AppColors.anarenk),)),
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
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('Giriş Yap',
                                  style: context.paragraph?.copyWith(color: AppColors.beyaz)),
                            ),
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  AuthService().signInWithGoogle().then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(), settings: RouteSettings(arguments: value)))); 
                                },
                              child: const CircleAvatar(
                                  radius: 24,
                                  backgroundImage: AssetImage('assets/google.png')),),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 20),
                                    child: Text("|", style: context.h4?.copyWith(color: Colors.black54),),
                                  ),
                                  GestureDetector(
                                onTap: () async {
                                  AuthService().signInWithGoogle().then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(), settings: RouteSettings(arguments: value)))); 
                                },
                              child: const CircleAvatar(
                                  radius: 24,
                                  backgroundImage: AssetImage('assets/google.png')),),
                            ],
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: RichText(
                              text: const TextSpan(
                                  text: 'Bir hesabın yok mu? ',
                                  style: TextStyle(
                                    color: AppColors.ikincirenk,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Kaydol',
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
                  ],
                ),
            
          ),
          // Main Row
        ),
      ),
    );
  }
}


