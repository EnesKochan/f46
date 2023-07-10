import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../ui/costum_theme.dart';
import 'header_bottom.dart';
import 'header_title.dart';

 class ProfileHeader extends StatefulWidget implements PreferredSizeWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
  @override
  Size get preferredSize =>  Size.fromHeight(250);
}

class _ProfileHeaderState extends State<ProfileHeader> {
  
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark, //Statusbar dark
      flexibleSpace: Container(
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.grey,
                  offset: Offset(
                        0,
                        0.75,
                      ),
                )
              ],
              image: DecorationImage(
                    image: NetworkImage('https://i.ibb.co/Z6N4RwW/appbar-Back.jpg'), //Appbar arkaplan
                      fit: BoxFit.cover,
                    ),
                    ),
          ),
      toolbarHeight: 164,
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)), //Border app bar
      ),
      shadowColor: AppColors.ikincirenk,
      leading: Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
              child: Column(
                children: [
                  IconButton(
                          icon: Icon(Icons.arrow_back_ios_new_outlined, color: context.secondary, size: 30,),
                          onPressed: () => Navigator.of(context).pop(),
                          ),
                ],
              ),
          ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 16, top: 8),
              child: Column(
                children: [
                  IconButton(
                          icon: Icon(Icons.share, color: context.secondary, size: 30,),
                          onPressed: () {},
                          ),
                ],
              ),
          ),
      ],
      title: HeaderTitle(name: "Murat", sehir: "İstanbul", ilce: currentUser.email!),
      bottom: HeaderDetails(takipci: 12, takipEdilen: 32, begeni: 32),
    );
  }
}
 
 




 
 

