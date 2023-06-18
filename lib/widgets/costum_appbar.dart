import 'package:f46/ui/costum_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CostumAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CostumAppbar({
    super.key,
  });

  @override
  Size get preferredSize =>  Size.fromHeight(80);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark, //Statusbar dark
      flexibleSpace: const Image(
        image: NetworkImage('https://i.ibb.co/Z6N4RwW/appbar-Back.jpg'), //Appbar arkaplan
        fit: BoxFit.cover,
      ),
      //backgroundColor: Colors.transparent, 
      toolbarHeight: 80,
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)), //Border app bar
      ),
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
            padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                  icon: Icon(Icons.location_on, size: 45, color: context.primary,),
                  onPressed: () {},
                  ),
          ),
      actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
                      radius: 25,
                      backgroundColor: context.secondary,
                      child: Text('MA'),
                    ),
          )
        ],
    );
  }
}