part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(FormzStatus.pure) FormzStatus status,
    required FormTextInput fieldUsername,
    required FormTextInput fieldPassword,
    @Default(true) bool obscurePassword,
    String? loginUser,
    String? error,
  }) = _LoginState;
}
