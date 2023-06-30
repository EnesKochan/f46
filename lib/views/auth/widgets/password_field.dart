import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth/login/login_bloc.dart';
import '../../../blocs/auth/login/login_event.dart';
import '../../../blocs/auth/login/login_state.dart';
import '../../../blocs/auth/register/register_bloc.dart';
import '../../../blocs/auth/register/register_event.dart';
import '../../../blocs/auth/register/register_state.dart';
import '../../../controller.dart';
import '../../../src/app_strings.dart';

class PasswordField extends StatelessWidget {
  PasswordField({Key? key, required this.isLogin}) : super(key: key);

  final bool isLogin;
  Controller cont = Controller();
  @override
  Widget build(BuildContext context) {
    return isLogin
        ? BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return TextFormField(
                controller: cont.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.key, color: Colors.orange),
                  hintText: AppStrings.password,
                ),
                validator: (value) => state.isValidPassword
                    ? null
                    : AppStrings.isValidPasswordMessage,
                onChanged: (value) => context.read<LoginBloc>().add(
                      LoginPasswordChanged(password: value),
                    ),
              );
            },
          )
        : BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.key, color: Colors.orange),
                  hintText: AppStrings.password,
                ),
                validator: (value) => state.isValidPassword
                    ? null
                    : AppStrings.isValidPasswordMessage,
                onChanged: (value) => context.read<RegisterBloc>().add(
                      RegisterPasswordChanged(password: value),
                    ),
              );
            },
          );
  }
}
