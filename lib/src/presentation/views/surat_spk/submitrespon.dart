import 'dart:async';

import 'package:flutter/material.dart';
import '../../../core/assets/assets.gen.dart';

class DitolakPertama extends StatelessWidget {
  const DitolakPertama({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      print('Selesai!');
      Navigator.pop(context);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.images.ditolak1.path),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Data yang disubmit tidak sesuai.\nSilahkan lakukan input ulang.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class DitolakTerakhir extends StatelessWidget {
  const DitolakTerakhir({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      print('Selesai!');
      Navigator.pop(context);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.images.ditolak1.path),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Anda telah mencapai batas input.\nData yang disubmit tidak sesuai.\nHarap menghubungi SPV",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class Diterima extends StatelessWidget {
  const Diterima({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      print('Selesai!');
      Navigator.pop(context);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.images.diterima1.path),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Stock Opname berhasil dikonfirmasi.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
