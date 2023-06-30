import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/auth/login/login_repository.dart';
import '../../bloc_status.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository? authRepo;

  LoginBloc({this.authRepo}) : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    // Email updated
    if (event is LoginEmailChanged) {
      emit(state.copyWith(email: event.email));

      // Password updated
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWith(password: event.password));

      // Form submitted
    } else if (event is LoginSubmitted) {
      emit(state.copyWith(appStatus: FormSubmitting()));

      try {
        await authRepo?.login();
        emit(state.copyWith(appStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(appStatus: SubmissionFailed(e)));
      }
    }
  }
}
