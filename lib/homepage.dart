import 'package:f46/ui/costum_theme.dart';
import 'package:flutter/material.dart';
import 'widgets/costum_appbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumAppbar(),
      body: Center(child: Text("Anasayfa3", style: context.h2)),
    );
  }
}
