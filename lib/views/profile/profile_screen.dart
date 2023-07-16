import 'package:cached_network_image/cached_network_image.dart';
import 'package:f46/ui/costum_theme.dart';
import 'package:f46/views/auth/login/login_page.dart';
import 'package:f46/views/home/widgets/costum_navbar.dart';
import 'package:f46/views/profile/widgets/profile_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:f46/views/profile/widgets/update_profile_photo.dart';

import '../../services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final currentUser = FirebaseAuth.instance.currentUser!;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CostumNavBar(),
      appBar: ProfileHeader(onTap: () {
        showModalBottomSheet(context: context, builder: (context){
                            return const Wrap(
                        children: [
                          ListTile(
                            leading: Icon(Icons.share),
                            title: Text('Deneme'),
                          ),
                          ListTile(
                            leading: Icon(Icons.copy),
                            title: Text('deneem'),
                          ),
                          ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('Deneme'),
                          ),
                        ],
                      );
                          }
                          );
      },),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Kaydedilen Konumlar", style: context.h5?.copyWith(fontWeight: FontWeight.w600),),
                const SizedBox(height: 8,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                        imageUrl: "https://firebasestorage.googleapis.com/v0/b/travelly-90e1c.appspot.com/o/map_demo.png?alt=media&token=04e003c6-7028-49ad-ad86-1e67a1bfd376"),
                ),
                const SizedBox(height: 8,),
                Text("Beğenilen Fotoğraflar", style: context.h5?.copyWith(fontWeight: FontWeight.w600),),
                const Row(
                  children: [
                    BegeniFoto(fotograf: "https://i.sozcucdn.com/wp-content/uploads/2020/07/08/iecrop/ayasofya-shutter_16_9_1594209202.jpg"),
                    BegeniFoto(fotograf: "https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/fe/6d/77.jpg"),
                  ],
                ),
              ],
        )),
      )
    );
  }
}

class BegeniFoto extends StatelessWidget {
  final String fotograf;
  const BegeniFoto({super.key, required this.fotograf});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 6),
        width: 106,
        height: 100,
        decoration: BoxDecoration(
        color: context.primary,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: 
                      ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: 
                        CachedNetworkImage(
                        imageUrl: fotograf, fit: BoxFit.cover,),),
                                              );;
  }
}



