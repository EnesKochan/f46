import 'package:f46/controller.dart';
import 'package:flutter/material.dart';

import '../../../src/app_strings.dart';

class NameField extends StatelessWidget {
  NameField({Key? key, required this.isLogin}) : super(key: key);
  final bool isLogin;

  Controller cont = Controller();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: cont.nameController,
      decoration: const InputDecoration(
        icon: Icon(Icons.person, color: Colors.orange),
        hintText: AppStrings.name,
      ),
    );
  }
}
