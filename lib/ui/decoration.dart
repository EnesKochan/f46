import 'package:flutter/material.dart';

class CustomBoxDecoration {
  static BoxDecoration getDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 3.0,
          offset: Offset(0, 1),
        )
      ],
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    );
  }
}
