import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth/register/register_bloc.dart';
import '../../../blocs/auth/register/register_state.dart';
import '../../../blocs/bloc_status.dart';
import '../../../repository/auth/register/register_repository.dart';
import '../../../src/app_assets.dart';
import '../../../src/app_colors.dart';
import '../../../ui/costum_theme.dart';
import '../widgets/have_account_text.dart';
import '../widgets/register_form_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterBloc(authRepo: RegisterRepository()),
        child: BlocListener<RegisterBloc, RegisterState>(
          listenWhen: (previous, current) =>
              previous?.appStatus != current?.appStatus,
          listener: (context, state) {
            final formStatus = state.appStatus;

            if (formStatus is SubmissionFailed) {
              _showSnackBar(context, formStatus.exception.toString());
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(height: 200, child: Image.asset(AppAssets.yazi)),
                    const SizedBox(height: 10),
                    FormRegWidget(isReg: true),
                    const SizedBox(height: 10),
                    const HaveAccountText(isLogin: false),
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
}
