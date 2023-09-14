import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/theme_colors.dart';


class ConfirmSuccessPage extends StatefulWidget {
  static const String routeName = '/confirm_success_page';
  const ConfirmSuccessPage({super.key, this.textBerhasil});

  final String? textBerhasil;

  @override
  State<ConfirmSuccessPage> createState() => _ConfirmSuccessPageState();
}

class _ConfirmSuccessPageState extends State<ConfirmSuccessPage> {
  @override
  Widget build(BuildContext context) {
    Timer(
        // ignore: prefer_const_constructors
        const Duration(seconds: 3),
        () => Navigator.pop(context, true));

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.material.confirm),
              SizedBox(
                height: 24,
              ),
              Text(
                widget.textBerhasil ?? "Permintaan berhasil dikirim !",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
