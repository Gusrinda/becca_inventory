import 'package:becca_supir/src/core/config/constant.dart';
import 'package:becca_supir/src/core/config/theme_colors.dart';
import 'package:becca_supir/src/presentation/views/absensi/absensi_page.dart';
import 'package:becca_supir/src/presentation/views/delivery_order/daftar_do_page.dart';
import 'package:becca_supir/src/presentation/views/home/custom_bottom_sheet.dart';
import 'package:becca_supir/src/presentation/views/surat_jalan/detail_surat_jalan_out_page.dart';
import 'package:becca_supir/src/presentation/views/surat_jalan/list_surat_jalan_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../core/assets/assets.gen.dart';
import '../surat_jalan/detail_surat_jalan_close_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCheckedIn = false;

  @override
  void initState() {
    isCheckedIn = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Assets.images.bgOrange.path),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: [
            Container(
              height: size.height * 0.7,
              padding: EdgeInsets.only(top: kToolbarHeight),
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        // height: 48,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(36)),
                              width: 72,
                              height: 72,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(35),
                                  child: Assets.images.profileSupir
                                      .image(fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Dwi Kurnia",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 2,
                                  // ),
                                  Text(
                                    "Surabaya",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ListSuratJalan.routeName);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFFFF2CC)),
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: themeBrown.withOpacity(0.3),
                                            shape: BoxShape.circle),
                                        padding: EdgeInsets.all(12),
                                        child: SvgPicture.asset(
                                            Assets.material.process),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "1",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: themeBrown,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "Diproses",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: themeBrown,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFFFF2CC)),
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: themeBrown.withOpacity(0.3),
                                          shape: BoxShape.circle),
                                      padding: EdgeInsets.all(12),
                                      child: SvgPicture.asset(
                                          Assets.material.done),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "20",
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: themeBrown,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Selesai",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: themeBrown,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: themeOrange.withOpacity(0.3),
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 20,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xFFFDB740),
                                    // color: Colors.white,
                                    // color: Colors.red,
                                    borderRadius: BorderRadius.circular(15)),
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      padding: EdgeInsets.all(12),
                                      child: SvgPicture.asset(
                                        Assets.material.box,
                                        width: 24,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, DaftarDOPage.routeName);
                                      },
                                      child: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Ada 2 DO yang belum dikonfirmasi",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "Ketuk untuk konfirmasi",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.4,
                maxChildSize: 1,
                builder: (_, controller) => Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: SafeArea(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      controller: controller,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ListSuratJalan.routeName);

                                    setState(() {
                                      isCheckedIn = !isCheckedIn;
                                    });
                                  },
                                  child: !isCheckedIn
                                      ? Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40, vertical: 20),
                                          decoration: BoxDecoration(
                                              color: Color(0xFFD9FFD9),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                  Assets.icons.masuk.path),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Check In",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        )
                                      : Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40, vertical: 20),
                                          decoration: BoxDecoration(
                                              color: Color(0xFFF3F3F3),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                  Assets.icons.masukGrey.path),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Check In",
                                                style: TextStyle(
                                                    color: Color(0xFFBBBBBB),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: GestureDetector(
                                    onTap: () {
                                      // Navigator.pushNamed(context, AbsensiPage.routeName, arguments: false);

                                      Navigator.pushNamed(context,
                                          DetailSuratJalanOut.routeName);

                                      setState(() {
                                        isCheckedIn = !isCheckedIn;
                                      });
                                    },
                                    child: isCheckedIn
                                        ? Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 20),
                                            decoration: BoxDecoration(
                                                color: Color(0xFFFFE2E2),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  Assets.icons.keluar.path,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Check Out",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 20),
                                            decoration: BoxDecoration(
                                                color: Color(0xFFF3F3F3),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  Assets.icons.keluarGrey.path,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Check Out",
                                                  style: TextStyle(
                                                      color: Color(0xFFBBBBBB),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                          )),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "Riwayat Pengiriman Terakhir",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: ListView.builder(
                              shrinkWrap: true, //MUST TO ADDED
                              //MUST TO ADDED
                              itemCount: 10,
                              // physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext c, int index) {
                                return CardPengirimanTerakhir(
                                  index: index * 2 + 1,
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardPengirimanTerakhir extends StatelessWidget {
  const CardPengirimanTerakhir({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailSuratJalanClose.routeName);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color(0xFFDDDDDD))),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE), shape: BoxShape.circle),
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset(
                Assets.material.form,
                width: 24,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SJ-00$index",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "PT. ABADI SENTOSA",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeCardListTarget extends StatelessWidget {
  const HomeCardListTarget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CircularPercentIndicator(
            radius: 20.0,
            lineWidth: 4.0,
            percent: 0.75,
            animation: true,
            center: Text(
              "75%",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10.0),
            ),
            backgroundColor: Colors.grey,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.blue,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Milliard Selang",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Target",
                      style: TextStyle(
                          color: ThemeColors.greyCaption,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Terpenuhi",
                      style: TextStyle(
                          color: ThemeColors.greyCaption,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("5.000.000",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400)),
                    Text("3.750.000",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MenuRangkuman extends StatelessWidget {
  const MenuRangkuman({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      // height: 118,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Juni 2023",
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jumlah Order",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "5",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Lihat detail >",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                VerticalDivider(
                  thickness: 2,
                  color: Colors.white54,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  flex: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Order",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "400.000.000",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.arrowtriangle_up_fill,
                              color: Colors.green, size: 10),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "5% dari bulan lalu",
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
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
