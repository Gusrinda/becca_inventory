part of 'auth_bloc.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
  me,
  verification
}

enum PageReady { notReady, ready }

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    @Default(AuthenticationStatus.unknown) AuthenticationStatus status,
    @Default(PageReady.notReady) PageReady statusPage,
    String? loginUser,
    String? userModel,
    List<String>? daftarArea,
    List<String>? daftarAreaID,
    String? userId,
  }) = _AuthenticationState;

  factory AuthenticationState.authenticated(String loginUser) =>
      AuthenticationState(
          status: AuthenticationStatus.authenticated, loginUser: loginUser);

  factory AuthenticationState.unauthenticated() =>
      const AuthenticationState(status: AuthenticationStatus.unauthenticated);

  factory AuthenticationState.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationStateFromJson(json);
}
