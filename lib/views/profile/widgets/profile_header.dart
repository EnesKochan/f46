import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../services/auth_service.dart';
import '../../../ui/costum_theme.dart';
import '../../auth/login/login_page.dart';
import 'header_bottom.dart';
import 'header_title.dart';

 class ProfileHeader extends StatefulWidget implements PreferredSizeWidget {
  void Function()? onTap;
  ProfileHeader({
    super.key, required this.onTap
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
  @override
  Size get preferredSize =>  const Size.fromHeight(250);
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
            padding: const EdgeInsets.only(left: 8, bottom: 94),
              child: 
          PopupMenuButton(
              icon: Icon(Icons.more_vert, color: context.secondary, size: 30,),
              itemBuilder: (context){
                return [
                      PopupMenuItem<int>(
                        onTap: widget.onTap,
                          value: 0,
                          child: const Text("Ayarlar"),
                      ),

                      PopupMenuItem<int>(
                        onTap: () async {
                        AuthService().signOut().then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage(), settings: RouteSettings(arguments: value)))); 
                        },
                          value: 1,
                          child: const Text("Çıkış Yap"),
                      ),
                  ];
              },
              onSelected:(value){
                if(value == 0){
                    print("Ayarlara tıklandı");
                }else if(value == 1){
                    print("çıkış yapıldı");
                }
              }
            ), ),
      ],
      title: HeaderTitle(name: currentUser.displayName!, sehir: "İstanbul", ilce: "Kadıköy"),
      bottom: const HeaderDetails(takipci: 3, takipEdilen: 2, begeni: 2),
    );
  }
}
 
 




 
 

