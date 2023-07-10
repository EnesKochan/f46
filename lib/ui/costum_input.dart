import 'package:flutter/material.dart';

import 'costum_theme.dart';

class CostumInput {

  static OutlineInputBorder Focus = 
  OutlineInputBorder(
    borderSide: const BorderSide(
    style: BorderStyle.solid,
    color: AppColors.anarenk),
    borderRadius: BorderRadius.circular(10),
    );
  static OutlineInputBorder Enabled =
  OutlineInputBorder(
    borderSide: BorderSide(
    style: BorderStyle.solid,
    color: AppColors.koyugri.withOpacity(0.3),
    ),
    borderRadius: BorderRadius.circular(10),
    );
}