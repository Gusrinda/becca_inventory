import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../core/config/constant.dart';

class ResultConfirmDOPage extends StatefulWidget {
  const ResultConfirmDOPage({super.key});

  static const String routeName = '/result_confirm_do_page';

  @override
  State<ResultConfirmDOPage> createState() => _ResultConfirmDOPageState();
}

class _ResultConfirmDOPageState extends State<ResultConfirmDOPage> {
  int doNow = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail DO"),
        centerTitle: true,
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
                      "DP-00$doNow",
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
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Material(
              child: InkWell(
                onTap: () {
                  print("object");

                  EasyLoading.show(status: "Loading . . .");

                  Timer(
                      // ignore: prefer_const_constructors
                      const Duration(seconds: 1), () {
                        EasyLoading.dismiss();
                    setState(() {
                      doNow++;
                    });
                  });
                },
                splashColor: Colors.white,
                child: Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: themeOrange),
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEEEEEE),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Kembali",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {} ,child: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white,),),
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
                color: Color(0xFFF5F5F5)),
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
              shrinkWrap: true,
              //MUST TO ADDED
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
