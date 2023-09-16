import 'dart:math';

import 'package:becca_supir/src/core/config/constant.dart';
import 'package:becca_supir/src/presentation/views/absensi/absensi_page.dart';
import 'package:becca_supir/src/presentation/views/surat_spk/submitrespon.dart';
import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/theme_colors.dart';

class DetailSuratJalanClose extends StatefulWidget {
  static const String routeName = '/detail_surat_jalan_close_page';

  const DetailSuratJalanClose({super.key});

  @override
  State<DetailSuratJalanClose> createState() => _DetailSuratJalanCloseState();
}

class _DetailSuratJalanCloseState extends State<DetailSuratJalanClose> {
  int statePage = 0;

  @override
  void initState() {
    super.initState();
    statePage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: GestureDetector(
            onTap: () async {
              setState(() {
                statePage = 0;
              });
            },
            child: const Text("Detail SPK")),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "No. SPK",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Tanggal",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("SPK-001"), Text("28 April 2023")],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Depo",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Gudang",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("WH-001"), Text("Gudang A")],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Detail Item",
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (BuildContext c, int index) {
                    if (statePage > 0) {
                      if (index == 0) {
                        return CardListWrong(index: index * 1 + 1);
                      } else {
                        return CardListCorrect(index: index * 1 + 1);
                      }
                    }
                    return CardListDO(
                      index: index * 1 + 1,
                    );
                  }),
            ),
            Center(
              child: SafeArea(
                minimum: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool? result = await handleFormSubmit(context);
                      if (result != null && result) {
                        print('STATE PAGE ${statePage}');

                        if (statePage == 0) {
                          showDialog(
                            context: context,
                            builder: (context) => DitolakPertama(),
                          );
                        }

                        if (statePage == 1) {
                          showDialog(
                            context: context,
                            builder: (context) => DitolakTerakhir(),
                          );
                        }

                        if (statePage == 2) {
                          await showDialog(
                            context: context,
                            builder: (context) => Diterima(),
                          );

                          Navigator.pop(context);
                        }

                        setState(() {
                          statePage += 1;
                        });

                        // Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
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
                Image(image: AssetImage(Assets.images.confirmation2.path)),
                const SizedBox(height: 16),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Apakah anda yakin  ?",
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
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          backgroundColor: ThemeColors.neutral4,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
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
                          backgroundColor: Colors.redAccent,
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Yes',
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
    Color containerColor;

    switch (index % 2) {
      case 0:
        containerColor = Colors.white;
        break;
      case 1:
        containerColor = const Color(0xffF5F5F5);
        break;
      default:
        containerColor = Colors.grey;
        break;
    }
    return Container(
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: containerColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 15, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        "Item ${index}",
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "CODE00${index}",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 25,
                          width: 25,
                          child: Align(
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove),
                              color: Colors.white,
                              iconSize: 10,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 35,
                          height: 20,
                          child: Center(child: Text("${index}")),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: const Color(0xffE7E9FD)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 25,
                          width: 25,
                          child: Align(
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                              color: Colors.white,
                              iconSize: 10,
                              alignment: Alignment.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardListWrong extends StatelessWidget {
  const CardListWrong({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    Color containerColor;

    switch (index % 2) {
      case 0:
        containerColor = Colors.white;
        break;
      case 1:
        containerColor = const Color(0xffF5F5F5);
        break;
      default:
        containerColor = Colors.grey;
        break;
    }
    return Container(
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: containerColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 15, left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        "Item ${index}",
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "CODE00${index}",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 35,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical: BorderSide(
                          color: Color(0xffCCD2E3),
                        ),
                      ),
                    ),
                    child: Center(child: Text("${index}")),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 25,
                          width: 25,
                          child: Align(
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove),
                              color: Colors.white,
                              iconSize: 10,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 35,
                          height: 20,
                          child: Center(child: Text("${index}")),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: const Color(0xffE7E9FD)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 25,
                          width: 25,
                          child: Align(
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                              color: Colors.white,
                              iconSize: 10,
                              alignment: Alignment.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardListCorrect extends StatelessWidget {
  const CardListCorrect({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    Color containerColor;

    switch (index % 2) {
      case 0:
        containerColor = Colors.white;
        break;
      case 1:
        containerColor = const Color(0xffF5F5F5);
        break;
      default:
        containerColor = Colors.grey;
        break;
    }
    return Container(
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: containerColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 0, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        "Item ${index}",
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "CODE00${index}",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 35,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical: BorderSide(
                          color: Color(0xffCCD2E3),
                        ),
                      ),
                    ),
                    child: Center(child: Text("${index}")),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape
                          .circle, // Untuk membuat latar belakang menjadi lingkaran
                      color: Colors.green, // Warna latar belakang hijau
                    ),
                    width: 30, // Lebar latar belakang
                    height: 30,
                    margin: const EdgeInsets.only(right: 90),
                    child: Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    "Miliard Selang ${_okRandom}MM",
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  )),
              Text("${_okRandom}0 ROLL")
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    "kodeitem00${_okRandom}",
                    style: const TextStyle(
                        fontSize: 10,
                        color: fontColorThin,
                        fontWeight: FontWeight.w400),
                  )),
              Text(
                "Tonase : ${index + _okRandom * 2}0",
                style: const TextStyle(
                    fontSize: 10,
                    color: fontColorThin,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          !isLast
              ? const Divider(
                  thickness: 1,
                  color: Color(0xFFEEEEEE),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
