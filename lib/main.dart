import 'package:f46/ui/costum_theme.dart';
import 'package:f46/views/welcome/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/auth/login/login_bloc.dart';
import 'blocs/auth/register/register_bloc.dart';


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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: tema,
        home:   const SplashScreen(),
      ),
    );
  }
}
