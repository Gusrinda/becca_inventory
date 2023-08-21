
import 'package:flutter/material.dart';

import '../../core/config/theme_colors.dart';

class GreenCard extends StatelessWidget {
  const GreenCard({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: ThemeColors.linearGradientColors,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: padding,
      child: child,
    );
  }
}

class WhiteCard extends StatelessWidget {
  const WhiteCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            offset: Offset.zero,
            blurRadius: 10,
            color: Color(0x4066D066),
          ),
        ],
      ),
      padding: padding,
      margin: margin,
      child: child,
    );
  }
}

class OutlineCard extends StatelessWidget {
  const OutlineCard({
    Key? key,
    required this.child,
    this.margin,
    this.padding,
    this.borderColor = ThemeColors.backgroundField,
  }) : super(key: key);

  final Widget child;
  final Color borderColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: child,
    );
  }
}
