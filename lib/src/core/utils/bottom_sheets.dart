import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theme_colors.dart';

const kModalBottomShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  ),
);

Future<T> showCustomBottomSheet<T>({
  required BuildContext context,
  required LayoutWidgetBuilder builder,
  ShapeBorder? shape = kModalBottomShape,
  bool isScrollControlled = true,
  bool isDismissible = true,
  Color? backgroundColor,
  String? title,
}) async {
  return await showModalBottomSheet(
    context: context,
    shape: shape,
    isScrollControlled: isScrollControlled,
    isDismissible: isDismissible,
    backgroundColor: backgroundColor ?? Colors.white,
    barrierColor: ThemeColors.black70,
    builder: (BuildContext bc) {
      if (title != null) {
        return LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              builder(context, constraints),
            ],
          );
        });
      }

      return LayoutBuilder(builder: builder);
    },
  );
}

Future<T> showCustomDraggableBottomSheet<T>({
  required BuildContext context,
  required LayoutWidgetBuilder builder,
  EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 16),
  bool isDismissible = true,
  double initialChildSize = 0.5,
  double minChildSize = 0.25,
  double maxChildSize = 1.0,
  String? title,
  Widget? bottom,
}) async {
  return await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: isDismissible,
    backgroundColor: ThemeColors.black70,
    builder: (BuildContext bc) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return DraggableScrollableSheet(
            minChildSize: minChildSize,
            initialChildSize: initialChildSize,
            maxChildSize: maxChildSize,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: kModalBottomShape.borderRadius,
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      title: title == null
                          ? null
                          : Text(
                              title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        padding: padding,
                        child: builder(context, constraints),
                      ),
                    ),
                    if (bottom != null) bottom,
                  ],
                ),
              );
            },
          );
        },
      );
    },
  );
}
