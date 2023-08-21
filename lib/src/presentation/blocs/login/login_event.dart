part of 'login_bloc.dart';


abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class OnUsernameChanged extends LoginEvent {
  const OnUsernameChanged(this.username);
  final String username;
  @override
  List<Object?> get props => [username];
}

class OnPasswordChanged extends LoginEvent {
  const OnPasswordChanged(this.password);
  final String password;
  @override
  List<Object?> get props => [password];
}

class TogglePasswordObscured extends LoginEvent {
  const TogglePasswordObscured(this.obscure);
  final bool obscure;
  @override
  List<Object?> get props => [obscure];
}

class SubmitLogin extends LoginEvent {
  const SubmitLogin();
  @override
  List<Object?> get props => [];
}
