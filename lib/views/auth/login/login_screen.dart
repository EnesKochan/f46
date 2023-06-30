import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth/login/login_bloc.dart';
import '../../../blocs/auth/login/login_state.dart';
import '../../../blocs/bloc_status.dart';
import '../../../repository/auth/login/login_repository.dart';
import '../../../src/app_assets.dart';
import '../../../src/app_colors.dart';
import '../../home/home_screen.dart';
import '../widgets/form_widget.dart';
import '../widgets/have_account_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageColor,
      body: BlocProvider(
        create: (context) => LoginBloc(authRepo: LoginRepository()),
        child: BlocListener<LoginBloc, LoginState>(
          listenWhen: (previous, current) =>
              previous.appStatus != current.appStatus,
          listener: (context, state) {
            final formStatus = state.appStatus;

            if (formStatus is SubmissionFailed) {
              _showSnackBar(context, formStatus.exception.toString());
            }
            if (formStatus is SubmissionSuccess) {
              _goToHome(context);
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(height: 300, child: Image.asset(AppAssets.man)),
                    SizedBox(height: 20),
                    FormWidget(isLogin: true),
                    const SizedBox(height: 10),
                    const HaveAccountText(isLogin: true),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _goToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false);
  }
}
