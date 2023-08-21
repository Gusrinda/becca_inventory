import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../core/assets/assets.gen.dart';
import '../../core/config/constant.dart';
import '../../core/config/theme_colors.dart';


class HeaderLabel extends StatelessWidget {
  const HeaderLabel(this.label, {super.key, this.trailing, this.onTapTrailing});

  final String label;
  final String? trailing;
  final VoidCallback? onTapTrailing;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      label,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
      ),
    );

    if (onTapTrailing != null) {
      return Row(
        children: [
          text,
          const Spacer(),
          GestureDetector(
            onTap: onTapTrailing,
            child: Text(
              trailing ?? 'Lihat Semua',
              style: TextStyle(fontSize: 10.sp),
            ),
          ),
        ],
      );
    }

    return text;
  }
}

class SubHeaderLabel extends StatelessWidget {
  const SubHeaderLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 10.sp,
        color: ThemeColors.greyCaption,
      ),
    );
  }
}

class TitleLabel extends StatelessWidget {
  const TitleLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class RsSubtitleLabel extends StatelessWidget {
  const RsSubtitleLabel(this.rs, {super.key, this.big = false});

  final String rs;
  final bool big;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Assets.images.logoBecca.image(height: big ? 14.sp : 12.sp),
            alignment: PlaceholderAlignment.middle,
          ),
          const TextSpan(text: '  '),
          TextSpan(text: rs),
        ],
      ),
      style: big ? TextStyle(fontSize: 14.sp) : TextStyle(fontSize: 12.sp),
    );
  }
}

class DivideBaris extends StatelessWidget {
  const DivideBaris({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Divider(
        thickness: 1,
        color: Colors.black26,
      ),
    );
  }
}

class TextListJudulSubJudul extends StatelessWidget {
  const TextListJudulSubJudul({
    super.key,
    required this.judul,
    required this.subJudul,
    this.styleJudul,
    this.styleSubJudul,
  });

  final String judul;
  final TextStyle? styleJudul;
  final String subJudul;
  final TextStyle? styleSubJudul;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            judul,
            style: styleJudul ??
                TextStyle(
                  fontSize: 11,
                  color: themeFontLight,
                  fontWeight: FontWeight.w300,
                ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            subJudul,
            style: styleSubJudul ??
                TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }
}
