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
      bottomNavigationBar: CostumNavBar(),
      appBar: ProfileHeader(),
      body: Center(child: Column(
        children: [
          Text(currentUser.displayName!),
          Center(child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                AuthService().signOut().then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(), settings: RouteSettings(arguments: value)))); 
                },

                 child: const Text("Çıkış")),
                 ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateProfilePhotoPage())); 
                    },

                  child: const Text("foto"))
              ],
          ),
          ),
        ],
      ),),
    );
  }
}