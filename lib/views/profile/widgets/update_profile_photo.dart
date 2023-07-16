import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

// İleriki süreçlerde profil düzenleme ekranları yaplırkn gotoğraf güncelleme ekranı olarak kullanılacak

class UpdateProfilePhotoPage extends StatefulWidget {
  const UpdateProfilePhotoPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UpdateProfilePhotoPageState createState() => _UpdateProfilePhotoPageState();
}

class _UpdateProfilePhotoPageState extends State<UpdateProfilePhotoPage> {
  File? _image;

  Future<void> _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _updateProfilePhoto() async {
    final user = FirebaseAuth.instance.currentUser;
    if (_image != null && user != null) {
      
      final previousPhotoURL = user.photoURL;

      
      final storageRef = FirebaseStorage.instance.ref().child('profile_photos/${user.uid}.jpg');
      await storageRef.putFile(_image!);

      
      final newPhotoURL = await storageRef.getDownloadURL();

    
      await user.updatePhotoURL(newPhotoURL);

      if (previousPhotoURL != null) {
        await FirebaseStorage.instance.refFromURL(previousPhotoURL).delete();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? CircleAvatar(
                    radius: 75,
                    backgroundImage: FileImage(_image!),
                  )
                : CircleAvatar(
                    radius: 75,
                    backgroundImage: NetworkImage(FirebaseAuth.instance.currentUser?.photoURL ?? ''),
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getImageFromCamera,
              child: const Text('Kamera aç'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateProfilePhoto,
              child: const Text('Profil Fotoğrafını Güncelle'),
            ),
          ],
        ),
      ),
    );
  }
}
