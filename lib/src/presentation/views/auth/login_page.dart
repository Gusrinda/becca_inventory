import 'package:becca_supir/src/core/utils/extensions.dart';
import 'package:becca_supir/src/presentation/views/auth/forget_password_page.dart';
import 'package:becca_supir/src/presentation/views/auth/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/constant.dart';
import '../../../core/config/theme_colors.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/login/login_bloc.dart';
import '../../widgets/hero_widget.dart';
import '../../widgets/logo_widget.dart';
import '../../widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/loginView";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      const id = String.fromEnvironment('USERNAME');
      const pass = String.fromEnvironment('PASSWORD');
      if (id.isNotEmpty && pass.isNotEmpty) {
        final bloc = context.read<LoginBloc>();
        bloc
          ..add(const OnUsernameChanged(id))
          ..add(const OnPasswordChanged(pass));
        bloc.state.fieldUsername.textEditingController.text = id;
        bloc.state.fieldPassword.textEditingController.text = pass;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state.status.isSubmissionFailure) {
          context.showErrorToast(state.error!);
          return;
        }

        if (state.status.isSubmissionSuccess) {
          if (state.error != null) {
            final nomorTelfon = await context.showInputNomorTelfonDialog(
                title: "Akun Anda Belum Terverifikasi",
                message: "Masukkan nomor telfon untuk mengirim verifikasi OTP",
                negativeButton: "Tidak",
                positiveButton: "Kirim");

            // if (nomorTelfon!.isNotEmpty) {
            //   print("Kirim Kode !");
            //   context.read<OtpBloc>().add(ResendOTP(nomorTelfon));
            //   Navigator.pushNamedAndRemoveUntil(
            //     context,
            //     OTPPage.routeName,
            //     arguments: nomorTelfon,
            //         (route) => false,
            //   );
            // }
          } else {
            context.read<AuthBloc>().add(
                  AuthenticationStatusChanged(
                    AuthenticationStatus.authenticated,
                    state.loginUser,
                  ),
                );
          }
        }
      },
      child: Scaffold(
        body: _contentView(),
      ),
    );
  }

  Widget _contentView() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              height: kToolbarHeight,
            ),
            Center(
              child: Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    color: themeFont),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Center(
              child: Text(
                "Masuk ke akun",
                style: TextStyle(fontSize: 14.sp, color: themeFont),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60, bottom: 30),
              child: SvgPicture.asset(Assets.material.login),
            ),
            const Hero(
              tag: 'Label-Email',
              flightShuttleBuilder: flightShuttleBuilder,
              child: FormTextLabel(
                label: "Email",
                labelColor: themeFontLight,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // ignore: prefer_const_constructors
            _FormInputEmail(),
            const SizedBox(
              height: 30,
            ),
            const Hero(
              tag: 'Label-Password',
              flightShuttleBuilder: flightShuttleBuilder,
              child: FormTextLabel(
                label: "Password",
                labelColor: themeFontLight,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            // ignore: prefer_const_constructors
            _FormInputPassword(),
            const SizedBox(
              height: 10,
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, ForgetPasswordPage.routeName),
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: themeRed2,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 86,
            ),
            BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                if (state.status.isSubmissionInProgress) {
                  return Ink(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const BoxDecoration(
                        color: themeNavy,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }

                return InkWell(
                  onTap: () {
                    context.read<LoginBloc>().add(const SubmitLogin());
                  },
                  child: Ink(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const BoxDecoration(
                        color: themeRedButton,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Hero(
              tag: 'Form-Footer',
              flightShuttleBuilder: flightShuttleBuilder,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Belum punya akun?  "),
                    TextSpan(
                      text: "Register",
                      style: const TextStyle(
                        color: themeRed2,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, RegisterPage.routeName);
                        },
                    ),
                  ],
                  style: TextStyle(fontSize: 12.sp),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30.sp,
            ),
          ],
        ),
      ),
    );
  }

// Future<void> handleResetPassword(BuildContext context) async {
//   final navigator = Navigator.of(context);
//   final email = await navigator.pushNamed(ForgotPasswordPage.routeName);
//
//   if (email is String) {
//     navigator.pushNamed(ForgotPasswordPage.routeName, arguments: email);
//   }
// }
}

class _FormInputPassword extends StatelessWidget {
  const _FormInputPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.fieldPassword != current.fieldPassword ||
          previous.obscurePassword != current.obscurePassword,
      builder: (context, state) {
        return Hero(
          tag: 'Form-Password',
          flightShuttleBuilder: flightShuttleBuilder,
          // ignore: prefer_const_constructors
          child: Material(
            color: Colors.transparent,
            // ignore: prefer_const_constructors
            child: FormzTextField(
              hintText: "masukkan password",
              textEditingController: state.fieldPassword.textEditingController,
              trailing: GestureDetector(
                child: !state.obscurePassword
                    ? Container(
                        padding: EdgeInsets.all(12),
                        child: SvgPicture.asset(Assets.material.eye))
                    // const Icon(
                    //   Icons.visibility_outlined,
                    //   color: themeOrange,
                    // )
                    : Container(
                        padding: EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          Assets.material.eye,
                          colorFilter:
                              ColorFilter.mode(themeRed2, BlendMode.srcIn),
                        )),
                onTap: () => context
                    .read<LoginBloc>()
                    .add(TogglePasswordObscured(!state.obscurePassword)),
              ),
              obscureText: state.obscurePassword,
              textInputAction: TextInputAction.done,
              onChanged: (password) =>
                  context.read<LoginBloc>().add(OnPasswordChanged(password)),
              readOnly: state.status.isSubmissionInProgress,
              errorText:
                  state.fieldPassword.invalid ? 'Silakan isi password' : null,
            ),
          ),
        );
      },
    );
  }
}

class _FormInputEmail extends StatelessWidget {
  const _FormInputEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.fieldUsername != current.fieldUsername,
      builder: (context, state) {
        return Hero(
          tag: 'Form-Email',
          flightShuttleBuilder: flightShuttleBuilder,
          // ignore: prefer_const_constructors
          child: Material(
            color: Colors.transparent,
            // ignore: prefer_const_constructors
            child: FormzTextField(
              textEditingController: state.fieldUsername.textEditingController,
              hintText: "masukkan email",
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChanged: (email) =>
                  context.read<LoginBloc>().add(OnUsernameChanged(email)),
              readOnly: state.status.isSubmissionInProgress,
              errorText:
                  state.fieldUsername.invalid ? 'Silakan isi EMAIL' : null,
            ),
          ),
        );
      },
    );
  }
}
