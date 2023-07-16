import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //giriş yap fonksiyonu
  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  //çıkış yap fonksiyonu
  signOut() async {
    await _auth.signOut();
  }

  //kayıt ol fonksiyonu
  Future<User?> createPerson(
      String name, 
      String surName, 
      String email, 
      String password,) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password,);
    await _auth.currentUser?.updateDisplayName(name + "" + surName);
    await _auth.currentUser?.updatePhotoURL("https://img.freepik.com/free-icon/user_318-159711.jpg");
    await _firestore
        .collection("Person")
        .doc(user.user?.uid)
        .set({'name': name, 
              'surName': surName,
              'email': email, 
              'takipci': 0,
              'takipEdilen': 0,
              'begeni': 0,
              'sehir': "İstanbul",
              'ilce': "Kadıköy"});

    return user.user;
  }




  // google sign in

 Future<User?> signInWithGoogle() async {
  final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication gAuth =await gUser!.authentication;

  final credential = GoogleAuthProvider.credential(accessToken: gAuth.accessToken, idToken: gAuth.idToken);

  final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  
  return userCredential.user;
  }

}

// google profil fotoğrafı




// google sign in

 signInWithGoogle() async {
  final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication gAuth =await gUser!.authentication;

  final credential = GoogleAuthProvider.credential(accessToken: gAuth.accessToken, idToken: gAuth.idToken);
  
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

// anonim giriş

Future<void> signInAnonymously() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
    User? user = userCredential.user;
    if (user != null) {
      // Anonim kullanıcı girişi başarılı oldu, istediğiniz işlemleri gerçekleştirebilirsiniz.
    }
  } catch (e) {
    print('Anonim kullanıcı girişi başarısız: $e');
  }
}