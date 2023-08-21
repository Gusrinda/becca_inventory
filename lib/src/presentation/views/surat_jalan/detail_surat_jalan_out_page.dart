import 'dart:math';

import 'package:becca_supir/src/core/config/constant.dart';
import 'package:becca_supir/src/presentation/views/absensi/absensi_page.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/theme_colors.dart';

class DetailSuratJalanOut extends StatefulWidget {
  static const String routeName = '/detail_surat_jalan_out_page';

  const DetailSuratJalanOut({super.key});

  @override
  State<DetailSuratJalanOut> createState() => _DetailSuratJalanOutState();
}

class _DetailSuratJalanOutState extends State<DetailSuratJalanOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE4622E),
      appBar: AppBar(
        backgroundColor: Color(0xFFE4622E),
        centerTitle: true,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          "Detail Delivery Order",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    flex: 40,
                    child: Text(
                      "No Delivery Plan",
                      style: TextStyle(color: Colors.white70),
                    )),
                Expanded(
                    flex: 60,
                    child: Text(
                      "DP-001",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Expanded(
                    flex: 40,
                    child: Text(
                      "Tanggal",
                      style: TextStyle(color: Colors.white70),
                    )),
                Expanded(
                    flex: 60,
                    child: Text(
                      "04/04/2023",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Expanded(
                    flex: 40,
                    child: Text(
                      "Customer",
                      style: TextStyle(color: Colors.white70),
                    )),
                Expanded(
                    flex: 60,
                    child: Text(
                      "PT. Hutama Karya",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Expanded(
                    flex: 40,
                    child: Text(
                      "Alamat",
                      style: TextStyle(color: Colors.white70),
                    )),
                Expanded(
                    flex: 60,
                    child: Text(
                      "Jl. Candi Lontar II No. 48 B",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 1,
              color: Colors.white70,
            ),
            SizedBox(
              height: 15,
            ),

            Expanded(
              flex : 1,
              child: ListView(
                children: [
                  Center(
                    child: Text("Sedang loading barang..",style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Center(
                    child: Text("PT. HUTAMA KARYA",style: TextStyle(fontSize: 16,
                        color: Colors.white, fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RippleAnimation(

                    color: Colors.orange,
                    delay: const Duration(milliseconds: 300),
                    repeat: true,
                    minRadius: 80,
                    ripplesCount: 10,
                    duration: const Duration(milliseconds: 10 * 300),
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(Assets.images.logoSupir.path, width: 128),
                    ),
                  ),
                  SizedBox(height: 30,),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true, //MUST TO ADDED
                      //MUST TO ADDED
                      itemCount: 4,
                      itemBuilder: (BuildContext c, int index) {
                        return CardDOWidget(index: index);
                      }),
                ],
              ),
            )

            ,
            SizedBox(height: 20,),
            SafeArea(
              minimum: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    final isOke = await handleFormSubmit(context);

                    if (isOke != null) {
                      if (isOke) {
                        Navigator.popAndPushNamed(context, AbsensiPage.routeName,
                            arguments: false);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: themeOrangeBg,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Check Out",
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
                  "Apakah anda yakin untuk check out ?",
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

class CardDOWidget extends StatelessWidget {
  const CardDOWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {

    var _random = new Random();
    var _diceface = _random.nextInt(4) + 1;

    List<String> sub = [
      "SUB",
      "PARALON",
      "OK",
      "TEST",
      "YEZ",
      "NUTZ",
      "SUGAR",
      "COPI"
    ];
    
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: ExpandablePanel(
        header:  IntrinsicHeight(
          child: Row(
            children: [
              Text(
                "SJ-00${index + 1}",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              VerticalDivider(
                thickness: 1,
                color: fontColorThin,
              ),
              Text(
                sub[_diceface],
                style: TextStyle(color: fontColorThin),
              )
            ],
          ),
        ),
        collapsed: SizedBox(),
        expanded: ListView.builder(
            shrinkWrap: true, //MUST TO ADDED
            physics: NeverScrollableScrollPhysics(),
            //MUST TO ADDED
            itemCount: _diceface,
            itemBuilder: (BuildContext c, int index) {
              return CardListItemDO(
                isLast: index == _diceface - 1,
                index: _diceface,
              );
            }),

      ),
    );
  }
}

class CardListItemDO extends StatelessWidget {
  const CardListItemDO({
    super.key,
    required this.isLast,
    required this.index,
  });

  final int index;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    var _random = new Random();
    var _okRandom = _random.nextInt(10) + 1;

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    "Miliard Selang ${_okRandom}MM",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  )),
              Text("${_okRandom}0 ROLL")
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    "kodeitem00${_okRandom}",
                    style: TextStyle(
                        fontSize: 10,
                        color: fontColorThin,
                        fontWeight: FontWeight.w400),
                  )),
              Text(
                "Tonase : ${index + _okRandom * 2}0",
                style: TextStyle(
                    fontSize: 10,
                    color: fontColorThin,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          !isLast
              ? Divider(
                  thickness: 1,
                  color: Color(0xFFEEEEEE),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
