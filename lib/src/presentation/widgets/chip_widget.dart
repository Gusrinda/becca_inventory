import 'package:becca_supir/src/core/config/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../core/config/theme_colors.dart';

class GreenChip extends StatelessWidget {
  const GreenChip(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF219653).withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 9.sp,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class ColorChip extends StatelessWidget {
  const ColorChip(this.label, {super.key, this.color = ThemeColors.red});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 9.sp, color: Colors.white),
      ),
    );
  }
}

class GreyChip extends StatelessWidget {
  const GreyChip(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ThemeColors.backgroundField,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 9.sp),
      ),
    );
  }
}

class GreyOutlineChip extends StatelessWidget {
  const GreyOutlineChip(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 22,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Color(0xFF858585))),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Center(
        child: Text(
          label,

          style: TextStyle(fontSize: 9, color: Color(0xFF858585)),
        ),
      ),
    );
  }
}

class FilterChips extends StatelessWidget {
  const FilterChips(
    this.label, {
    super.key,
    this.selected = false,
    this.selectedColor = const Color(0XFFE3FFDE),
    this.selectedTextColor,
  });

  final String label;
  final bool selected;
  final Color selectedColor;
  final Color? selectedTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? selectedColor : null,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: selected ? null : Border.all(color: const Color(0xffe3ffde)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11.sp,
          color: selected
              ? selectedTextColor ?? Theme.of(context).primaryColor
              : Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class ActiveInActiveChip extends StatelessWidget {
  const ActiveInActiveChip({super.key, this.active = false});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: active
            ? ThemeColors.green.withOpacity(0.1)
            : ThemeColors.red.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text(
        active ? 'Aktif' : 'Kadaluarsa',
        style: TextStyle(
          fontSize: 9.sp,
          color: active ? ThemeColors.green : ThemeColors.red,
        ),
      ),
    );
  }
}
