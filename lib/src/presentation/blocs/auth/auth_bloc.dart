import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';


part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';
part 'auth_bloc.g.dart';

class AuthBloc extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  AuthBloc() : super(const AuthenticationState()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    // on<FetchProfile>(_onFetchProfile);
    // on<RegisterUserFetch>(_getUserRegister);
  }

  // final UserRepository userRepository;

  FutureOr<void> _onAuthenticationStatusChanged(
      AuthenticationStatusChanged event,
      Emitter<AuthenticationState> emit) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        final loginUser = event.loginUser;

        if (loginUser != null) {
          emit(state.copyWith(
              statusPage: PageReady.notReady, loginUser: loginUser));

          // final userModel = await _tryGetUser();
          // final managerModel = await _tryGetManager();
          //
          // print("USER MODEL $userModel");
          //
          // if (userModel == null) {
          //   return emit(AuthenticationState.unauthenticated());
          // }
          //
          // String daftarIDArea = userModel.areaIds ?? "[1]";
          //
          // print("Daftar id area => $daftarIDArea");
          //
          // var list = json.decode(daftarIDArea);
          //
          // final daftarArea = await _tryGetDaftarArea(list);
          //
          // List<String> namaArea =
          //     List.from(daftarArea!.map((e) => e.values.first));
          // List<String> idArea = List.from(daftarArea.map((e) => e.keys.first));
          //
          // print("NAMA AREA : ${namaArea}");
          // print("ID AREA : ${idArea}");
          //
          // print("INI LOH MASUK KE ME ! ${namaArea}");

          emit(AuthenticationState.authenticated(loginUser));

          // emit(state.copyWith(
          //     status: AuthenticationStatus.authenticated,
          //     loginUser: loginUser,
          //     managerModel: managerModel,
          //     userModel: userModel,
          //     daftarArea: namaArea,
          //     statusPage: PageReady.ready,
          //     daftarAreaID: idArea,
          //     userId: userModel.id.toString()));
          break;
        }

        return emit(AuthenticationState.unauthenticated());
      case AuthenticationStatus.me:
        // emit(state.copyWith(statusPage: PageReady.notReady));
        //
        // final userModel = await _tryGetUser();
        // final managerModel = await _tryGetManager();
        //
        // print("USER MODEL $userModel");
        //
        // if (userModel == null) {
        //   return emit(AuthenticationState.unauthenticated());
        // }
        //
        // String daftarIDArea = userModel.areaIds ?? "[1]";
        //
        // print("Daftar id area => $daftarIDArea");
        //
        // var list = json.decode(daftarIDArea);
        //
        // final daftarArea = await _tryGetDaftarArea(list);
        //
        // List<String> namaArea =
        //     List.from(daftarArea!.map((e) => e.values.first));
        // List<String> idArea = List.from(daftarArea.map((e) => e.keys.first));
        //
        // print("NAMA AREA : ${namaArea}");
        // print("ID AREA : ${idArea}");
        //
        // print("INI LOH MASUK KE ME ! ${namaArea}");
        //
        // emit(state.copyWith(
        //     managerModel: managerModel,
        //     userModel: userModel,
        //     loginUser: state.loginUser,
        //     daftarArea: namaArea,
        //     statusPage: PageReady.ready,
        //     daftarAreaID: idArea,
        //     userId: userModel.id.toString()));
        // break;
        break;
      case AuthenticationStatus.verification:
        print("MASUK BLOC SINI VERIFIKASI DULU !");
        final loginUser = event.loginUser;
        return emit(AuthenticationState(
            status: AuthenticationStatus.verification,
            loginUser: loginUser,
            userModel: loginUser));
      default:
        return emit(const AuthenticationState());
    }
  }

  FutureOr<void> _onAuthenticationLogoutRequested(
      AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationState.unauthenticated());
  }

  // FutureOr<void> _onFetchProfile(
  //     FetchProfile event, Emitter<AuthenticationState> emit) async {
  //   final loginUser = state.loginUser!;
  //   final userModel = state.userModel!;
  //   try {
  //     final token = '${loginUser.tokenType} ${loginUser.token}';
  //     final result = await userRepository.me(token);
  //     final updatedUserModel = result.data;
  //     emit(state.copyWith(
  //       userModel: updatedUserModel!.copyWith(id: userModel.id),
  //     ));
  //   } catch (e, s) {
  //     debugPrint(e.toString());
  //     debugPrintStack(stackTrace: s);
  //   }
  // }
  //
  // Future<UserModel?> _tryGetUser() async {
  //   LoginUserModel? loginUser = state.loginUser;
  //   UserModel? userModel;
  //   if (loginUser != null) {
  //     try {
  //       final token = '${loginUser.tokenType} ${loginUser.token}';
  //       print("TOKEN : \n$token");
  //       final result = await userRepository.me(token);
  //       print("RESULTNYA : $result");
  //       userModel = result.data;
  //     } catch (e) {
  //       print("MASUK CATCH ? ${e.toString()}");
  //     }
  //   } else {
  //     // delayed return the data for showing splash screen
  //     await Future.delayed(const Duration(milliseconds: 750));
  //   }
  //   return userModel;
  // }
  //
  // Future<List<Map<String, String>>?> _tryGetDaftarArea(
  //     List<dynamic> daftarID) async {
  //   List<Map<String, String>> daftarArea = [];
  //
  //   final getArea = await userRepository.daftarArea();
  //
  //   for (var dataID in daftarID) {
  //     for (var element in getArea) {
  //       if (element.id == dataID) {
  //         daftarArea.add({"${element.id}": element.name});
  //       }
  //     }
  //   }
  //
  //   print("NAMA NAMA AREA : ${daftarArea}");
  //
  //   return daftarArea;
  // }
  //
  // Future<UserListModel?> _tryGetManager() async {
  //   LoginUserModel? loginUser = state.loginUser;
  //   String areaModel = state.userModel?.areaIds ?? "1";
  //   UserListModel? userModel;
  //   print("GETTING MANAGER !");
  //   if (loginUser != null) {
  //     try {
  //       final token = '${loginUser.tokenType} ${loginUser.token}';
  //
  //       final result = await userRepository.getDataManager(token, areaModel);
  //       print("RESULTNYA : $result");
  //       userModel = result.first;
  //     } catch (e) {
  //       print("MASUK CATCH ? ${e.toString()}");
  //     }
  //   } else {
  //     // delayed return the data for showing splash screen
  //     await Future.delayed(const Duration(milliseconds: 750));
  //   }
  //   return userModel;
  // }
  //
  // Future<UserModel?> _getUserRegister() async {
  //   LoginUserModel? loginUser = state.loginUser;
  //   UserModel? userModel;
  //   if (loginUser != null) {
  //     userModel = loginUser.data;
  //   } else {
  //     await Future.delayed(const Duration(milliseconds: 750));
  //   }
  //   return userModel;
  // }

  @override
  AuthenticationState? fromJson(Map<String, dynamic> json) {
    AuthenticationState? state;
    try {
      state = AuthenticationState.fromJson(json);
    } catch (_) {}
    return state;
  }

  @override
  Map<String, dynamic>? toJson(AuthenticationState state) {
    return state.toJson();
  }
}
