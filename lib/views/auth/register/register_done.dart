import 'package:f46/ui/costum_theme.dart';
import 'package:f46/views/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterDone extends StatefulWidget {
  const RegisterDone({super.key});

  @override
  State<RegisterDone> createState() => _RegisterDoneState();
}

class _RegisterDoneState extends State<RegisterDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
            child: Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_txJcSM.json', repeat: false,),),
             Text("Kayıt Onaylandı", style: context.h4,),
             const SizedBox(height: 8,),
             InkWell(
                            onTap: () {
                              Navigator.of(context).push(_createRoute());
                            },
             child: Text("Giriş Yap!", style: context.paragraph?.copyWith(color: AppColors.anarenk, fontWeight: FontWeight.w600),),)
          ],
        ),
    ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
