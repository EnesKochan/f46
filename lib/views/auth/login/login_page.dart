import 'dart:async';
import 'package:f46/views/auth/register/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../services/auth_service.dart';
import '../../../ui/costum_input.dart';
import '../../../ui/costum_theme.dart';
import '../../home/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
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
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
             child: Column(
                  children: [
                    Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(image: AssetImage('assets/pana.png')),
                          //Lottie.network('https://assets1.lottiefiles.com/packages/lf20_AYgNPVAQgf.json', reverse: true, ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                'Giriş Yap',
                                style: context.h4?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
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
                          const SizedBox(height: 10),
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
                                  const Text('Şifremi hatırla'),
                                ],
                              ),
                              const SizedBox(width: 90),
                              InkWell(onTap: () {}, child: 
                                  Text('Şifremi unuttum', style: context.paragraph?.copyWith(color: AppColors.anarenk),)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
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
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  AuthService().signInWithGoogle().then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen(), settings: RouteSettings(arguments: value)))); 
                                },
                              child: const CircleAvatar(
                                  radius: 24,
                                  backgroundImage: AssetImage('assets/google.png')),),
                                  Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Text("|", style: context.h4?.copyWith(color: Colors.black54),),
                                  ),
                                  GestureDetector(
                                onTap: () async {
                                  AuthService().signInWithGoogle().then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen(), settings: RouteSettings(arguments: value)))); 
                                },
                              child: const CircleAvatar(
                                  backgroundColor: AppColors.gri,
                                  radius: 24,
                                  backgroundImage: AssetImage('assets/apple.png')),),
                            ],
                          ),
                          const SizedBox(height: 20),
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


