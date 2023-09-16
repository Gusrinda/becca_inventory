import 'package:becca_supir/src/core/config/constant.dart';
import 'package:becca_supir/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/theme_colors.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../widgets/hero_widget.dart';
import '../../widgets/text_field_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0),
        shrinkWrap: true,
        children: [
          Container(
            decoration: BoxDecoration(
              color: themeOrangeBg,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Assets.images.bgOrangeInv.path),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    // Tindakan yang diambil ketika gambar diklik
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(75),
                    ),
                    width: 100,
                    height: 100,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: SvgPicture.asset(Assets.material.camera)),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dinda Salim",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 290,
                  padding: const EdgeInsets.only(bottom: 11),
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 1.0),
                  )),
                  child: const Text(
                    "Profil",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: themeFontDefault,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 12,
                ),
                const FormInputUserProfile(),
                const SizedBox(
                  height: 12,
                ),
                const FormInputEmailProfile(),
                const SizedBox(
                  height: 12,
                ),
                const FormInputPhoneProfile(),
                // SizedBox(
                //   height: 12,
                // ),
                // FormInputGenderProfile(),
                const SizedBox(
                  height: 12,
                ),
                const FormInputNewPassword(),
                const SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  child: ButtonLogout(
                    onTap: () => handleLogOut(context),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

handleLogOut(BuildContext context) async {
  final bloc = context.read<AuthBloc>();
  final confirm = await context.showConfirmationBottomSheet(
    image: Assets.images.logoBecca.path,
    imageWidth: 0,
    title: 'Konfirmasi Keluar',
    message: 'Apakah Anda yakin akan keluar dari aplikasi ?',
    positiveButton: 'Keluar',
  );

  if (confirm == true) {
    bloc.add(const AuthenticationLogoutRequested());
  }
}

class ButtonLogout extends StatelessWidget {
  const ButtonLogout({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Form-logout-user',
      flightShuttleBuilder: flightShuttleBuilder,
      // ignore: prefer_const_constructors
      child: Material(
        color: Colors.transparent,
        child: FormzUnderlineTextField(
          leading: Container(
            padding: const EdgeInsets.all(12),
            height: 16,
            width: 16,
            child: SvgPicture.asset(Assets.material.logoutInv),
          ),
          onTap: onTap,
          enabled: true,
          readOnly: true,
          textEditingController: TextEditingController(
            text: "Logout",
          ),
          textInputAction: TextInputAction.next,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

class FormInputNewPasswordConfirmation extends StatelessWidget {
  const FormInputNewPasswordConfirmation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Form-retype-new-password-user',
      flightShuttleBuilder: flightShuttleBuilder,
      // ignore: prefer_const_constructors
      child: Material(
        color: Colors.transparent,
        child: FormzUnderlineTextField(
          leading: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(Assets.material.lockInv),
          ),
          enabled: true,
          obscureText: true,
          textEditingController: null,
          textInputAction: TextInputAction.next,
          trailing: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                Assets.material.eye,
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
            ),
            onTap: () {},
          ),
          onChanged: (passwordKonfirmasi) {},
          errorText: () {
            // if (state.fieldNewPasswordConfirmation.invalid &&
            //     state.fieldNewPasswordConfirmation.value.isNotEmpty) {
            //   return 'Silakan ulangi password';
            // }
            //
            // final password = state.fieldNewPassword.value;
            // final confirmPassword =
            //     state.fieldNewPasswordConfirmation.value;
            // if (password.isNotEmpty &&
            //     confirmPassword.isNotEmpty &&
            //     password != confirmPassword) {
            //   return 'Konfirmasi password tidak sesuai';
            // }

            return null;
          }(),
        ),
      ),
    );
  }
}

class FormInputNewPassword extends StatelessWidget {
  const FormInputNewPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Form-new-password-user',
      flightShuttleBuilder: flightShuttleBuilder,
      // ignore: prefer_const_constructors
      child: Material(
        color: Colors.transparent,
        child: FormzUnderlineTextField(
          leading: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(Assets.material.lockInv),
          ),
          trailing: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                Assets.material.editInv,
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
            ),
            onTap: () {},
          ),
          enabled: true,
          obscureText: true,
          hintText: 'enter new password',
          textEditingController: TextEditingController(
            text: "Logout",
          ),
          textInputAction: TextInputAction.next,
          onChanged: (password) => {},
        ),
      ),
    );
  }
}

class FormInputPhoneProfile extends StatelessWidget {
  const FormInputPhoneProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Form-phone-user',
      flightShuttleBuilder: flightShuttleBuilder,
      // ignore: prefer_const_constructors
      child: Material(
        color: Colors.transparent,
        child: FormzUnderlineTextField(
          trailing: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              Assets.material.editInv,
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
          ),
          leading: Container(
            padding: const EdgeInsets.all(12),
            height: 16,
            width: 16,
            child: SvgPicture.asset(
              Assets.material.phoneInv,
            ),
          ),
          enabled: true,
          keyboardType: TextInputType.phone,
          textEditingController: TextEditingController(text: "0822234566789"),
          onChanged: (phone) {
            // context.read<PersonalDataBloc>().add(OnPersonalChanged(
            //     email: state.fieldEmail.value,
            //     phone: phone,
            //     gender: state.fieldGender.value));
          },
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }
}

class FormInputEmailProfile extends StatelessWidget {
  const FormInputEmailProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Form-email-user',
      flightShuttleBuilder: flightShuttleBuilder,
      // ignore: prefer_const_constructors
      child: Material(
        color: Colors.transparent,
        child: FormzUnderlineTextField(
          trailing: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              Assets.material.editInv,
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
          ),
          leading: Container(
            padding: const EdgeInsets.all(12),
            height: 16,
            width: 16,
            child: SvgPicture.asset(
              Assets.material.messageInv,
            ),
          ),
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          textEditingController:
              TextEditingController(text: "dindasalim@bca.com"),
          onChanged: (email) {
            // context.read<PersonalDataBloc>().add(OnPersonalChanged(
            //       email: email,
            //       phone: state.fieldPhone.value,
            //       gender: state.fieldGender.value,
            //     ))
          },
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }
}

class FormInputUserProfile extends StatelessWidget {
  const FormInputUserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Form-nama-user',
      flightShuttleBuilder: flightShuttleBuilder,
      // ignore: prefer_const_constructors
      child: Material(
        color: Colors.transparent,
        child: FormzUnderlineTextField(
          trailing: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              Assets.material.editInv,
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
          ),
          leading: Container(
            padding: const EdgeInsets.all(12),
            height: 16,
            width: 16,
            child: SvgPicture.asset(
              Assets.material.userInv,
              colorFilter:
                  const ColorFilter.mode(Colors.redAccent, BlendMode.srcIn),
            ),
          ),
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          textEditingController: TextEditingController(text: "Dinda Salim"),
          onChanged: (email) {
            // context.read<PersonalDataBloc>().add(OnPersonalChanged(
            //       email: email,
            //       phone: state.fieldPhone.value,
            //       gender: state.fieldGender.value,
            //     ))
          },
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }
}
