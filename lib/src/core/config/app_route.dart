import 'package:becca_supir/main.dart';
import 'package:becca_supir/src/presentation/views/absensi/absensi_page.dart';
import 'package:becca_supir/src/presentation/views/absensi/absensi_page.dart';
import 'package:becca_supir/src/presentation/views/auth/forget_password_page.dart';
import 'package:becca_supir/src/presentation/views/auth/forget_password_page.dart';
import 'package:becca_supir/src/presentation/views/auth/otp_page.dart';
import 'package:becca_supir/src/presentation/views/auth/otp_page.dart';
import 'package:becca_supir/src/presentation/views/auth/register_page.dart';
import 'package:becca_supir/src/presentation/views/auth/register_page.dart';
import 'package:becca_supir/src/presentation/views/delivery_order/daftar_do_page.dart';
import 'package:becca_supir/src/presentation/views/delivery_order/daftar_do_page.dart';
import 'package:becca_supir/src/presentation/views/delivery_order/result_confirm_do_page.dart';
import 'package:becca_supir/src/presentation/views/delivery_order/result_confirm_do_page.dart';
import 'package:becca_supir/src/presentation/views/home/dashboard.dart';
import 'package:becca_supir/src/presentation/views/home/dashboard.dart';
import 'package:becca_supir/src/presentation/views/surat_spk/detail_surat_spk_close_page.dart';
import 'package:becca_supir/src/presentation/views/surat_spk/detail_surat_spk_close_page.dart';
import 'package:becca_supir/src/presentation/views/surat_spk/detail_surat_spk_in_page.dart';
import 'package:becca_supir/src/presentation/views/surat_spk/detail_surat_spk_out_page.dart';
import 'package:becca_supir/src/presentation/views/surat_spk/detail_surat_spk_out_page.dart';
import 'package:becca_supir/src/presentation/views/surat_spk/list_surat_spk.dart';
import 'package:becca_supir/src/presentation/views/surat_spk/list_surat_spk.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/blocs/login/login_bloc.dart';
import '../../presentation/views/auth/login_page.dart';
import '../../presentation/views/splashscreen.dart';
import '../../presentation/views/success/confirm_success_page.dart';

class AppRoute {
  const AppRoute._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late WidgetBuilder builder;
    bool fullScreenDialog = false;

    switch (settings.name) {
      case LoginPage.routeName:
        builder = (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginBloc(

              ),
            ),
          ],
          child: const LoginPage(),
        );
        fullScreenDialog = true;
        break;
      case RegisterPage.routeName:
        builder = (context) => const RegisterPage();
        break;
      case OTPPage.routeName:
        builder = (context) => const OTPPage();
        break;
      case ForgetPasswordPage.routeName:
        builder = (context) => const ForgetPasswordPage();
        break;
      case DashboardPage.routeName:

        print("ARGUMENT ? => ${settings.arguments}");

        builder = (context) => DashboardPage(
          page: pageSelectController.stream,
        );
        break;
      case ConfirmSuccessPage.routeName:
        String? textArgument = settings.arguments as String?;
        builder = (context) =>  ConfirmSuccessPage(textBerhasil: textArgument,);
        break;
      case AbsensiPage.routeName:
        final isCheckin = settings.arguments as bool;
        builder = (context) =>  AbsensiPage(isCheckIn: isCheckin);
        break;
      case DetailSuratJalanIn.routeName:
        builder = (context) => const DetailSuratJalanIn();
        break;
      case DetailSuratJalanOut.routeName:
        builder = (context) => const DetailSuratJalanOut();
        break;
      case DetailSuratJalanClose.routeName:
        builder = (context) => const DetailSuratJalanClose();
        break;
      case ListSuratJalan.routeName:
        builder = (context) => const ListSuratJalan();
        break;
      case DaftarDOPage.routeName:
        builder = (context) => const DaftarDOPage();
        break;
      case ResultConfirmDOPage.routeName:
        builder = (context) => const ResultConfirmDOPage();
        break;
      default:
        builder = (context) => const SplashScreen();
        break;
    }

    return MaterialPageRoute<void>(
        settings: settings,
        builder: builder,
        fullscreenDialog: fullScreenDialog,
        maintainState: true);
  }
}
