import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../ui/costum_theme.dart';

class HeaderTitle extends StatefulWidget {
  final String name;
  final String sehir;
  final String ilce;
  const HeaderTitle({super.key, required this.name, required this.sehir, required this.ilce});

  @override
  State<HeaderTitle> createState() => _HeaderTitleState();
}

class _HeaderTitleState extends State<HeaderTitle> {
   final currentUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return  Column(children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: AppColors.anarenk,
          child: CircleAvatar(
            backgroundImage: NetworkImage(currentUser.photoURL!),
            radius: 46,),
        ),
        const SizedBox(height: 8,),
        Text(widget.name, style: context.paragraph?.copyWith(fontWeight: FontWeight.w600),),
        Text("${widget.sehir} , ${widget.ilce}", style: context.small,)
      ]);
  }
}