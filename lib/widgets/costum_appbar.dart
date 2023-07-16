import 'package:f46/ui/costum_theme.dart';
import 'package:f46/views/profile/profile_screen.dart';
import 'package:f46/widgets/anonim_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CostumAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String pPhoto;
  const CostumAppbar({
    super.key, required this.pPhoto,
  });
  @override
  Size get preferredSize =>  const Size.fromHeight(80);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
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
      //backgroundColor: Colors.transparent, 
      toolbarHeight: 80,
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)), //Border app bar
      ),
      shadowColor: AppColors.ikincirenk,
      title: 
        Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("İstanbul", style: context.h5?.copyWith(fontWeight: FontWeight.w600,),),
              Text("Kadiköy", style: context.small?.copyWith(color: context.secondary),),
               ],
         ),
      leading: 
          Padding(
            padding: const EdgeInsets.only(left: 6),
              child: IconButton(
                  icon: const Icon(Icons.location_on, size: 45, color: AppColors.anarenk,),
                  onPressed: () {},
                  ),
          ),
        leadingWidth: 40,
      actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: 
                  InkWell(
                    onTap: () {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser is User && currentUser.isAnonymous) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AnonimAlert();
        },
      );
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileScreen()));
    }
  },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.anarenk,
                      child: CircleAvatar(
                        radius: 23,
                        backgroundImage: NetworkImage(pPhoto),
                      ),
                    ),
                  ),
          )
        ],
    );
  }
}


