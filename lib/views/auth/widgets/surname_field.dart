import 'package:flutter/material.dart';

import '../../../controller.dart';
import '../../../src/app_strings.dart';

class SurnameField extends StatelessWidget {
  SurnameField({Key? key, required this.isLogin}) : super(key: key);
  final bool isLogin;
  Controller cont = Controller();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: cont.surNameController,
      decoration: const InputDecoration(
        icon: Icon(Icons.person, color: Colors.orange),
        hintText: AppStrings.surname,
      ),
    );
  }
}
