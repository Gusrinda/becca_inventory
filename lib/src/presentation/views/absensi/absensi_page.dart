import 'dart:async';
import 'dart:io';

import 'package:becca_supir/main.dart';
import 'package:becca_supir/src/core/config/constant.dart';
import 'package:becca_supir/src/core/utils/formatter.dart';
import 'package:becca_supir/src/presentation/views/home/dashboard.dart';
import 'package:becca_supir/src/presentation/views/success/confirm_success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/theme_colors.dart';

class AbsensiPage extends StatefulWidget {
  static const String routeName = '/absensi_page_page';

  const AbsensiPage({super.key, required this.isCheckIn});

  final bool isCheckIn;

  @override
  State<AbsensiPage> createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () async {
                    pickMetode("Camera");
                  },
                  child: pickedFile == null
                      ? Center(
                          child: Container(
                              padding: EdgeInsets.all(86),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.grey,
                                size: 60,
                              )),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(pickedFile!.path),
                              )),
                        ),
                ),
                SafeArea(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10, left: 20),
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_back,
                        color: themeOrange,
                        size: 16,
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        widget.isCheckIn ? "Check In" : "Check Out",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: pickedFile == null
                                ? Colors.black
                                : Colors.white,
                            fontSize: 16.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Tanggal",
                          style: TextStyle(
                              color: Color(0xFF8F8F8F),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      !widget.isCheckIn ? Expanded(
                        flex: 1,
                        child: Text(
                          "Durasi",
                          style: TextStyle(
                              color: Color(0xFF8F8F8F),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ) : SizedBox(),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          kDateTimeShortMonthFormat.format(DateTime.now()),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      !widget.isCheckIn
                          ? Expanded(
                              child: Text(
                                "${kMinuteFormat.format(DateTime.now())} Menit",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Alamat",
                    style: TextStyle(
                        color: Color(0xFF8F8F8F),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Jl. Candi Lontar II No. 48 Surabaya",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lattitude",
                              style: TextStyle(
                                  color: Color(0xFF8F8F8F),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "8.3987652",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Longitude",
                              style: TextStyle(
                                  color: Color(0xFF8F8F8F),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "-7.9376453",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                  SafeArea(
                    minimum: const EdgeInsets.fromLTRB(0, 0, 0, 28),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (pickedFile != null) {
                            final isOke = await handleFormSubmit(context);

                            // context.

                            EasyLoading.show(status: "Loading . . .");

                            Timer(
                                // ignore: prefer_const_constructors
                                const Duration(seconds: 2), () async {
                              if (isOke != null) {
                                if (isOke) {
                                  EasyLoading.dismiss();
                                  final lihatRiwayat = await handleFormSuccess(
                                      context, widget.isCheckIn);

                                  if (lihatRiwayat != null) {
                                    if (lihatRiwayat) {
                                      Navigator.popUntil(
                                          context,
                                          (route) =>
                                              route.settings.name ==
                                              DashboardPage.routeName);
                                      pageSelectController.add(1);
                                    } else {
                                      Navigator.popUntil(
                                          context,
                                          (route) =>
                                              route.settings.name ==
                                              DashboardPage.routeName);
                                    }
                                  } else {
                                    Navigator.popUntil(
                                        context,
                                        (route) =>
                                            route.settings.name ==
                                            DashboardPage.routeName);
                                  }
                                }
                              }
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: pickedFile == null
                                ? Colors.grey
                                : widget.isCheckIn
                                    ? Colors.green
                                    : Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            widget.isCheckIn ? "Check In" : "Check Out",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  final _picker = ImagePicker();
  XFile? pickedFile;

  Future pickMetode(String metode) async {
    try {
      final pickFile = await _picker.pickImage(
          source:
              metode == "Camera" ? ImageSource.camera : ImageSource.gallery);

      if (pickFile == null) return;
      setState(() => this.pickedFile = pickFile);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<String?> handleFormPilihFoto(BuildContext context) async {
    final rxPickup = ValueNotifier('Camera');

    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(24, 40, 24, 20),
            constraints: const BoxConstraints(minWidth: 340),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Pilih Metode Ambil Gambar",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: themeFontDefault),
                ),
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: MediaQuery.of(context).size.width / 9),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...[
                          'Camera',
                          'Gallery',
                        ].map((pickup) {
                          return ValueListenableBuilder<String>(
                            valueListenable: rxPickup,
                            builder: (context, groupValue, child) {
                              return RadioListTile(
                                contentPadding: EdgeInsets.all(0),
                                value: pickup,
                                activeColor: themeOrangeBg,
                                groupValue: groupValue,
                                onChanged: (value) => rxPickup.value = value!,
                                title: Text(
                                  pickup,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: themeBlack),
                                ),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context, null),
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
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, rxPickup.value);
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
                          child: const Text('OK',
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
                  "Apakah anda yakin?",
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

  Future<bool?> handleFormSuccess(BuildContext context, bool isCheckIn) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
            constraints: const BoxConstraints(minWidth: 340),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Checkin Berhasil !",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 48,
                ),
                Image.asset(Assets.images.successConfirm.path),
                const SizedBox(
                  height: 48,
                ),
                !isCheckIn
                    ? Row(
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
                                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                                child: const Text(
                                  'KEMBALI',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: themeFontDefault),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
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
                                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                                child: const Text('LIHAT RIWAYAT',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context, false),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            backgroundColor: themeOrange,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: const Text(
                              'KEMBALI',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
