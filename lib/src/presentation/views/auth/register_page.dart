import 'package:becca_supir/src/presentation/views/auth/login_page.dart';
import 'package:becca_supir/src/presentation/views/auth/otp_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/constant.dart';
import '../../../core/config/theme_colors.dart';
import '../../widgets/hero_widget.dart';
import '../../widgets/text_field_widget.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register_page';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "Register",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
          ),
          Text(
            "Buat akun baru",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 12
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              padding: EdgeInsets.all(20),
              shrinkWrap: true,
              children: [
                //NAMA
                const Hero(
                  tag: 'Label-RegisterName',
                  flightShuttleBuilder: flightShuttleBuilder,
                  child: FormTextLabel(
                    label: "Nama",
                    labelColor: themeFontDefault,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Hero(
                  tag: 'Form-RegisterName',
                  flightShuttleBuilder: flightShuttleBuilder,
                  // ignore: prefer_const_constructors
                  child: Material(
                    color: Colors.transparent,
                    // ignore: prefer_const_constructors
                    child: FormzTextField(

                      hintText: "masukkan nama lengkap",
                      onTap: () {},
                      textEditingController: TextEditingController(text: null),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                //ID PEGAWAI
                const Hero(
                  tag: 'Label-RegisterID',
                  flightShuttleBuilder: flightShuttleBuilder,
                  child: FormTextLabel(
                    label: "ID Pegawai",
                    labelColor: themeFontDefault,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Hero(
                  tag: 'Form-RegisterID',
                  flightShuttleBuilder: flightShuttleBuilder,
                  // ignore: prefer_const_constructors
                  child: Material(
                    color: Colors.transparent,
                    // ignore: prefer_const_constructors
                    child: FormzTextField(

                      hintText: "masukkan id pegawai",
                      onTap: () {},
                      textEditingController: TextEditingController(text: null),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                //AREA
                const Hero(
                  tag: 'Label-RegisterArea',
                  flightShuttleBuilder: flightShuttleBuilder,
                  child: FormTextLabel(
                    label: "Area",
                    labelColor: themeFontDefault,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Hero(
                  tag: 'Form-RegisterArea',
                  flightShuttleBuilder: flightShuttleBuilder,
                  // ignore: prefer_const_constructors
                  child: Material(
                    color: Colors.transparent,
                    // ignore: prefer_const_constructors
                    child: FormzTextField(

                      hintText: "pilih area",
                      trailing: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: themeOrange,
                        ),
                      ),
                      onTap: () {},
                      textEditingController: TextEditingController(text: null),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                //EMAIL
                const Hero(
                  tag: 'Label-RegisterEmail',
                  flightShuttleBuilder: flightShuttleBuilder,
                  child: FormTextLabel(
                    label: "Email",
                    labelColor: themeFontDefault,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Hero(
                  tag: 'Form-RegisterEmail',
                  flightShuttleBuilder: flightShuttleBuilder,
                  // ignore: prefer_const_constructors
                  child: Material(
                    color: Colors.transparent,
                    // ignore: prefer_const_constructors
                    child: FormzTextField(

                      hintText: "masukkan email anda",
                      onTap: () {},
                      textEditingController: TextEditingController(text: null),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                //NO HP
                const Hero(
                  tag: 'Label-RegisterPhone',
                  flightShuttleBuilder: flightShuttleBuilder,
                  child: FormTextLabel(
                    label: "Nama",
                    labelColor: themeFontDefault,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Hero(
                  tag: 'Form-RegisterPhone',
                  flightShuttleBuilder: flightShuttleBuilder,
                  // ignore: prefer_const_constructors
                  child: Material(
                    color: Colors.transparent,
                    // ignore: prefer_const_constructors
                    child: FormzTextField(

                      hintText: "masukkan nomor telfon anda",
                      onTap: () {},
                      textEditingController: TextEditingController(text: null),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                //PASSWORD
                const Hero(
                  tag: 'Label-RegisterPassword',
                  flightShuttleBuilder: flightShuttleBuilder,
                  child: FormTextLabel(
                    label: "Password",
                    labelColor: themeFontDefault,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Hero(
                  tag: 'Form-RegisterPassword',
                  flightShuttleBuilder: flightShuttleBuilder,
                  // ignore: prefer_const_constructors
                  child: Material(
                    color: Colors.transparent,
                    // ignore: prefer_const_constructors
                    child: FormzTextField(

                      hintText: "masukkan password",
                      obscureText: true,
                      trailing: Container(
                          padding: EdgeInsets.all(12),
                          child: SvgPicture.asset(Assets.material.eye)),
                      onTap: () {},
                      textEditingController: TextEditingController(text: null),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                //REPASSWORD
                const Hero(
                  tag: 'Label-RegisterPasswordKonfirmasi',
                  flightShuttleBuilder: flightShuttleBuilder,
                  child: FormTextLabel(
                    label: "Konfirmasi Password",
                    labelColor: themeFontDefault,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Hero(
                  tag: 'Form-RegisterPasswordKonfirmasi',
                  flightShuttleBuilder: flightShuttleBuilder,
                  // ignore: prefer_const_constructors
                  child: Material(
                    color: Colors.transparent,
                    // ignore: prefer_const_constructors
                    child: FormzTextField(

                      hintText: "masukkan kembali password",
                      obscureText: true,
                      trailing:Container(
                          padding: EdgeInsets.all(12),
                          child: SvgPicture.asset(Assets.material.eye)),
                      onTap: () {},
                      textEditingController: TextEditingController(text: null),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
            
          ),
          SafeArea(
              minimum: EdgeInsets.only(bottom: 32, left: 32, right: 32),
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: OutlinedButton(
                        onPressed: () async {
                          final isOke = await handleFormSubmit(context);

                          if (isOke != null) {
                            if (isOke) {
                              Navigator.popAndPushNamed(context, OTPPage.routeName);
                            }
                          }
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        style: OutlinedButton.styleFrom(
                            backgroundColor: themeOrangeBg,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.symmetric(vertical: 8)),
                      )),
                  SizedBox(height: 8,),
                  Hero(
                    tag: 'Form-Footer',
                    flightShuttleBuilder: flightShuttleBuilder,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "Sudah punya akun ?  "),
                          TextSpan(
                            text: "Login",
                            style: const TextStyle(
                              color: themeOrange,
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                              },
                          ),
                        ],
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ))
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
                  "Apakah anda yakin untuk daftar?",
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
