import 'package:becca_supir/src/presentation/views/surat_jalan/detail_surat_jalan_in_page.dart';
import 'package:becca_supir/src/presentation/views/surat_jalan/detail_surat_jalan_out_page.dart';
import 'package:becca_supir/src/presentation/views/surat_jalan/riwayat_surat_jalan_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/constant.dart';
import '../../../core/config/theme_colors.dart';
import '../../../core/utils/bottom_sheets.dart';
import '../../widgets/text_field_widget.dart';

class ListSuratJalan extends StatefulWidget {
  static const String routeName = '/list_surat_jalan_page';
  const ListSuratJalan({super.key});

  @override
  State<ListSuratJalan> createState() => _ListSuratJalanState();
}

class _ListSuratJalanState extends State<ListSuratJalan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Delivery Order"),
        centerTitle: true,
        actions: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 10),
          //   child: InkWell(
          //     onTap: () async {
          //       final filterBy = await HandleShowModalForm();
          //
          //       print("FILTER BY => $filterBy");
          //     },
          //     child: ClipRRect(
          //         borderRadius: BorderRadius.circular(60),
          //         child: Container(
          //             width: 36,
          //             height: 36,
          //             color: themeOrangeBg,
          //             child: Icon(
          //               CupertinoIcons.sort_up,
          //               color: Colors.white,
          //             ))),
          //   ),
          // ),
          // SizedBox(
          //   width: 20,
          // )
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
                itemCount: 3,
                itemBuilder: (BuildContext c, int index) {
                  return CardListSuratJalan(
                    index: index * 2 + 1,
                    onTap: () {

                      if (index.isOdd) {
                        Navigator.pushNamed(context, DetailSuratJalanOut.routeName);
                      }  else {
                        Navigator.pushNamed(context, DetailSuratJalanIn.routeName);
                      }


                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

  Future<String?> HandleShowModalForm() {
    final rxPickup = ValueNotifier('Tanggal');

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
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
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
                      ...['Tanggal', 'Customer', 'No. Surat Jalan']
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
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }

}
