// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  FormzStatus get status => throw _privateConstructorUsedError;
  FormTextInput get fieldUsername => throw _privateConstructorUsedError;
  FormTextInput get fieldPassword => throw _privateConstructorUsedError;
  bool get obscurePassword => throw _privateConstructorUsedError;
  String? get loginUser => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {FormzStatus status,
      FormTextInput fieldUsername,
      FormTextInput fieldPassword,
      bool obscurePassword,
      String? loginUser,
      String? error});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? fieldUsername = null,
    Object? fieldPassword = null,
    Object? obscurePassword = null,
    Object? loginUser = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      fieldUsername: null == fieldUsername
          ? _value.fieldUsername
          : fieldUsername // ignore: cast_nullable_to_non_nullable
              as FormTextInput,
      fieldPassword: null == fieldPassword
          ? _value.fieldPassword
          : fieldPassword // ignore: cast_nullable_to_non_nullable
              as FormTextInput,
      obscurePassword: null == obscurePassword
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      loginUser: freezed == loginUser
          ? _value.loginUser
          : loginUser // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      FormTextInput fieldUsername,
      FormTextInput fieldPassword,
      bool obscurePassword,
      String? loginUser,
      String? error});
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginState>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? fieldUsername = null,
    Object? fieldPassword = null,
    Object? obscurePassword = null,
    Object? loginUser = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_LoginState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      fieldUsername: null == fieldUsername
          ? _value.fieldUsername
          : fieldUsername // ignore: cast_nullable_to_non_nullable
              as FormTextInput,
      fieldPassword: null == fieldPassword
          ? _value.fieldPassword
          : fieldPassword // ignore: cast_nullable_to_non_nullable
              as FormTextInput,
      obscurePassword: null == obscurePassword
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      loginUser: freezed == loginUser
          ? _value.loginUser
          : loginUser // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LoginState implements _LoginState {
  const _$_LoginState(
      {this.status = FormzStatus.pure,
      required this.fieldUsername,
      required this.fieldPassword,
      this.obscurePassword = true,
      this.loginUser,
      this.error});

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  final FormTextInput fieldUsername;
  @override
  final FormTextInput fieldPassword;
  @override
  @JsonKey()
  final bool obscurePassword;
  @override
  final String? loginUser;
  @override
  final String? error;

  @override
  String toString() {
    return 'LoginState(status: $status, fieldUsername: $fieldUsername, fieldPassword: $fieldPassword, obscurePassword: $obscurePassword, loginUser: $loginUser, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.fieldUsername, fieldUsername) ||
                other.fieldUsername == fieldUsername) &&
            (identical(other.fieldPassword, fieldPassword) ||
                other.fieldPassword == fieldPassword) &&
            (identical(other.obscurePassword, obscurePassword) ||
                other.obscurePassword == obscurePassword) &&
            (identical(other.loginUser, loginUser) ||
                other.loginUser == loginUser) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, fieldUsername,
      fieldPassword, obscurePassword, loginUser, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {final FormzStatus status,
      required final FormTextInput fieldUsername,
      required final FormTextInput fieldPassword,
      final bool obscurePassword,
      final String? loginUser,
      final String? error}) = _$_LoginState;

  @override
  FormzStatus get status;
  @override
  FormTextInput get fieldUsername;
  @override
  FormTextInput get fieldPassword;
  @override
  bool get obscurePassword;
  @override
  String? get loginUser;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
