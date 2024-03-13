import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      final email = event.email;
      final pasword = event.password;
      emit(AuthLoading());
      try {
        ///Faliures
        //Email validation using Regex
        if (email.isEmpty ||
            !email.contains('@') ||
            pasword.isEmpty ||
            pasword.length < 6) {
          return emit(AuthFailure('Invalid email or password'));
        }

        ///Success
        //Consider geting user info from the database here
        await Future.delayed(
          const Duration(seconds: 1),
          () {
            emit(AuthSuccess(uEmail: email, uPassword: pasword));
          },
        );
      } catch (e) {
        return emit(AuthFailure(e.toString()));
      }
    });
  }
}
