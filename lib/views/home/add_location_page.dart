import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddLocationPage extends StatefulWidget {
  const AddLocationPage({super.key});

  @override
  State<AddLocationPage> createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {

  
  
  
  
  final TextEditingController _locationDescription = TextEditingController();
  final TextEditingController _locationTitle = TextEditingController();
  final TextEditingController _locationImg = TextEditingController();
  final TextEditingController _locationKonum = TextEditingController();
  final TextEditingController _locationDocName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
            TextField(
                    controller: _locationDocName,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.orange,
                      ),
                      labelText: 'Dokümantasyon ID',
                    )),
            TextField(
                    controller: _locationTitle,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.orange,
                      ),
                      labelText: 'Başlık',
                    )),
            TextField(
                    controller: _locationDescription,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.orange,
                      ),
                      labelText: 'Açıklama',
                    )),
            TextField(
                    controller: _locationImg,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.orange,
                      ),
                      labelText: 'Fotoğraf Linki',
                    )),
            TextField(
                    controller: _locationKonum,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.orange,
                      ),
                      labelText: 'Şehir , ilçe',
                    )),
                    ElevatedButton(
                    onPressed: () {
                      Map<String,String> dataToSave={
                        'title': _locationTitle.text,
                        'description': _locationDescription.text, 
                        'img': _locationImg.text,
                        'konum': _locationKonum.text,
                      };

                      FirebaseFirestore.instance.collection('locations').doc(_locationDocName.text).set(dataToSave);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child:
                        const Text('Kaydet')),
      ]
                  ),
      )
      
    );
  }
}