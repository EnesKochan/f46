import 'package:f46/views/auth/login/login_page.dart';
import 'package:flutter/material.dart';

import '../ui/costum_theme.dart';

class AnonimAlert extends StatelessWidget {
  const AnonimAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            backgroundColor: AppColors.gri,
            icon: const Icon(Icons.warning, size: 45,),
            title: const Text("Kullanıcı Girişi"),
            content: const Text("Bu özelliği kullanmak için giriş yapmalısınız!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // kapat
                },
                child: Text("Tamam", style: context.paragraph?.copyWith(color: AppColors.kirmizi, fontWeight: FontWeight.w500),),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.anarenk
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text("Giriş Yap", style: context.paragraph?.copyWith(color: AppColors.beyaz, fontWeight: FontWeight.w600),),
              ),
            ],
          );;
  }
}