import 'dart:math';

import 'package:becca_supir/src/core/config/constant.dart';
import 'package:becca_supir/src/presentation/views/absensi/absensi_page.dart';
import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/theme_colors.dart';

class DetailSuratJalanIn extends StatefulWidget {
  static const String routeName = '/detail_surat_jalan_in_page';

  const DetailSuratJalanIn({super.key});

  @override
  State<DetailSuratJalanIn> createState() => _DetailSuratJalanInState();
}

class _DetailSuratJalanInState extends State<DetailSuratJalanIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail Delivery Order"),
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
                      style: TextStyle(color: fontColorThin),
                    )),
                Expanded(
                    flex: 60,
                    child: Text(
                      "DP-001",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
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
                      style: TextStyle(color: fontColorThin),
                    )),
                Expanded(
                    flex: 60,
                    child: Text(
                      "04/04/2023",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
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
                      style: TextStyle(color: fontColorThin),
                    )),
                Expanded(
                    flex: 60,
                    child: Text(
                      "PT. Hutama Karya",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
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
                      style: TextStyle(color: fontColorThin),
                    )),
                Expanded(
                    flex: 60,
                    child: Text(
                      "Jl. Candi Lontar II No. 48 B",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  shrinkWrap: true, //MUST TO ADDED
                  //MUST TO ADDED
                  itemCount: 4,
                  itemBuilder: (BuildContext c, int index) {
                    return CardListDO(
                      index: index,
                    );
                  }),
            ),
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
                            arguments: true);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Check In",
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
                  "Apakah anda yakin untuk check in ?",
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

class CardListDO extends StatelessWidget {
  const CardListDO({
    super.key,
    required this.index,
  });

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
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFF5F5F5)
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      "SJ-00${index + 1}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    )),
                Text(sub[_diceface])
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
        ],
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
