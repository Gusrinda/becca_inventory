import 'package:becca_supir/src/core/utils/extensions.dart';
import 'package:becca_supir/src/presentation/views/success/confirm_success_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/constant.dart';
import '../../../core/config/theme_colors.dart';
import '../../widgets/hero_widget.dart';

class OTPPage extends StatefulWidget {
  static const String routeName = '/otp_page';

  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 50 + kToolbarHeight,
          ),
          const Center(
            child: Text(
              "Kode OTP",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: fontColorBold),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          const Center(
            child: Text(
              "Kode OTP telah dikirim ke WhatsApp Anda",
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: OtpTextField(
              numberOfFields: 4,
              showFieldAsBox: true,
              fieldWidth: 64,
              cursorColor: themeNavy,
              enabledBorderColor: themeNotSelected,
              focusedBorderColor: themeNavy,
              onSubmit: (value) {
                context.showToast("KODE OTP ANDA : ${value}");
                // context.read<OtpBloc>().add(InputOTP(value));
              },
            ),
          ),
          Hero(
            tag: 'Form-Footer',
            flightShuttleBuilder: flightShuttleBuilder,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: "Tidak mendapatkan kode? ",
                      style: TextStyle(fontSize: 14)),
                  TextSpan(
                    text: "Resend",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        // print("PHONE NUMBER ? ${widget.phoneNumber}");

                        // final kirim = await context.showConfirmDialog(
                        //     title: "Kirim OTP",
                        //     message: "Kirim ulang kode OTP ke nomor anda ?",
                        //     negativeButton: "TIDAK",
                        //     positiveButton: "YA");
                        //
                        // if (kirim!) {
                        //   print("KIRIM KODE !");
                        //   // ignore: use_build_context_synchronously
                        //   context
                        //       .read<OtpBloc>()
                        //       .add(ResendOTP(widget.phoneNumber));
                        // }
                      },
                  ),
                ],
                style: TextStyle(fontSize: 12),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(flex: 1, child: SizedBox()),
          SafeArea(
              minimum: EdgeInsets.only(bottom: 48, left: 32, right: 32),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: OutlinedButton(
                    onPressed: () async {
                      final isOke = await handleFormSubmit(context);

                      if (isOke != null) {
                        if (isOke) {
                          Navigator.popAndPushNamed(
                              context, ConfirmSuccessPage.routeName,
                              arguments: "Pendaftaran berhasil!");
                        }
                      }
                    },
                    child: Text(
                      "Send",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: themeOrangeBg,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.symmetric(vertical: 12)),
                  )))
        ],
      ),
    );
  }

  Future<bool?> handleFormSubmit(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 16),
            constraints: const BoxConstraints(minWidth: 340),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage(Assets.images.confirmation.path)),
                const SizedBox(height: 16),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Apakah anda yakin ?",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: themeFontDefault),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context, false),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          backgroundColor: ThemeColors.neutral4,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: themeFontDefault),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeOrangeBg,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: const Text('Yes',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
