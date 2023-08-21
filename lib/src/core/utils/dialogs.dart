import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../presentation/widgets/card_widget.dart';
import '../config/theme_colors.dart';


Future<bool?> showConfirmationDialog({
  required BuildContext context,
  String? title,
  required String message,
  String negativeButton = 'Batal',
  String positiveButton = 'Ya',
}) async {
  return showDialog(
    context: context,
    barrierColor: ThemeColors.black70,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.sp)),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(24.sp, 24.sp, 24.sp, 16.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null) ...{
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 16.sp),
              },
              Text(
                message,
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 16.sp),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context, false),
                      style: ElevatedButton.styleFrom(
                        visualDensity: VisualDensity.standard,
                        backgroundColor: ThemeColors.backgroundField,
                        foregroundColor: ThemeColors.greyCaption,
                      ),
                      child: Text(negativeButton),
                    ),
                  ),
                  SizedBox(width: 16.sp),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context, true),
                      style: ElevatedButton.styleFrom(
                        visualDensity: VisualDensity.standard,
                      ),
                      child: Text(positiveButton),
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

class ChoiceItem {
  final String image;
  final String title;
  final String subtitle;

  ChoiceItem({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChoiceItem &&
          runtimeType == other.runtimeType &&
          image == other.image &&
          title == other.title &&
          subtitle == other.subtitle;

  @override
  int get hashCode => image.hashCode ^ title.hashCode ^ subtitle.hashCode;
}

Future<ChoiceItem?> showChoiceDialog({
  required BuildContext context,
  required String title,
  required List<ChoiceItem> options,
  String negativeButton = 'Batal',
  String positiveButton = 'Pilih',
}) async {
  return showDialog(
    context: context,
    barrierColor: ThemeColors.black70,
    builder: (context) {
      final rxOption = ValueNotifier(options.first);

      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.sp)),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(24.sp, 24.sp, 24.sp, 16.sp),
          constraints: const BoxConstraints(minWidth: 340),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 16.sp),
              ...options.map(
                (option) => ValueListenableBuilder<ChoiceItem>(
                  valueListenable: rxOption,
                  builder: (context, selectedOption, child) {
                    final active = selectedOption == option;

                    final leading = Image.asset(option.image, height: 32);

                    if (active) {
                      return WhiteCard(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: leading,
                          title: Text(
                            option.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(option.subtitle),
                          trailing: Icon(
                            Icons.check_circle,
                            color: Theme.of(context).primaryColor,
                          ),
                          onTap: () => rxOption.value = option,
                        ),
                      );
                    }

                    return OutlineCard(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        leading: leading,
                        title: Text(option.title),
                        subtitle: Text(option.subtitle),
                        onTap: () => rxOption.value = option,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.sp),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context, false),
                      style: ElevatedButton.styleFrom(
                        visualDensity: VisualDensity.standard,
                        backgroundColor: ThemeColors.backgroundField,
                        foregroundColor: ThemeColors.greyCaption,
                      ),
                      child: Text(negativeButton),
                    ),
                  ),
                  SizedBox(width: 16.sp),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context, rxOption.value),
                      style: ElevatedButton.styleFrom(
                        visualDensity: VisualDensity.standard,
                      ),
                      child: Text(positiveButton),
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
