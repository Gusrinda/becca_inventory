import 'package:becca_supir/src/presentation/views/surat_jalan/detail_surat_jalan_close_page.dart';
import 'package:becca_supir/src/presentation/views/surat_jalan/detail_surat_jalan_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/config/constant.dart';
import '../../../core/config/theme_colors.dart';
import '../../../core/utils/bottom_sheets.dart';
import '../../widgets/text_field_widget.dart';

class SuratJalanPage extends StatefulWidget {
  const SuratJalanPage({super.key});

  @override
  State<SuratJalanPage> createState() => _SuratJalanPageState();
}

class _SuratJalanPageState extends State<SuratJalanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat Delivery Order"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
              onTap: () async {
                final filterBy = await HandleShowModalForm();

                print("FILTER BY => $filterBy");
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Container(
                      width: 36,
                      height: 36,
                      color: themeOrangeBg,
                      child: Icon(
                        CupertinoIcons.sort_up,
                        color: Colors.white,
                      ))),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
            child: SearchFieldGrayBar(
                hintText: "Search ...",
                fillColor: ThemeColors.grey6,
                onSubmitted: (value) {}),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "Semua",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
                shrinkWrap: true, //MUST TO ADDED
                //MUST TO ADDED
                itemCount: 3,
                itemBuilder: (BuildContext c, int index) {
                  return CardListSuratJalan(
                    index: index * 2 + 1,
                    onTap: () {
                      Navigator.pushNamed(
                          context, DetailSuratJalanClose.routeName);
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

  Future<String?> HandleShowModalForm() {
    final rxPickup = ValueNotifier('Terbaru - Terlama');

    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      )),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
            borderRadius: kModalBottomShape.borderRadius,
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Text(
                      "Sort By",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Text(
                      "Reset",
                      style: TextStyle(
                          color: Color(0xFFCCD2E3), fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12,
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
                      ...['Terbaru - Terlama', 'Terlama - Terbaru', 'Customer A-Z', 'Customer Z-A']
                          .map((pickup) {
                        return ValueListenableBuilder<String>(
                          valueListenable: rxPickup,
                          builder: (context, groupValue, child) {
                            return RadioListTile(
                              contentPadding: EdgeInsets.all(0),
                              value: pickup,
                              activeColor: themeOrange,
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
              SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: themeOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        Navigator.pop(context, rxPickup.value);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          "Terapkan",
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        );
      },
    );
  }
}

class CardListSuratJalan extends StatelessWidget {
  const CardListSuratJalan({
    super.key,
    required this.index,
    required this.onTap,
  });

  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 18),
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
              child: FaIcon(
                FontAwesomeIcons.wpforms,
                color: Colors.grey,
                size: 24,
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
                    "PT. ABADI SENTOSA",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Jl. Rajawali VI no 114 Surabaya",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Jumlah SJ : ${index}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),SizedBox(
                    height: 4,
                  ),
                  Text(
                    "11/06/2023",
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
