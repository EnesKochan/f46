import 'package:f46/src/app_colors.dart';
import 'package:f46/views/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/auth/login/login_bloc.dart';
import 'blocs/auth/register/register_bloc.dart';
import 'blocs/home/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
        BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          primarySwatch: AppColors.primarySwatch,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
