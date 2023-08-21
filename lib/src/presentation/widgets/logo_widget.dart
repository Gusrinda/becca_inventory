import 'package:flutter/material.dart';

import '../../core/assets/assets.gen.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key, this.width = 200}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: Assets.images.logoBecca.keyName,
        child: Assets.images.logoBecca.image(width: width),
      ),
    );
  }
}
