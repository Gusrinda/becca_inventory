import 'package:flutter/material.dart';
import '../../../core/assets/assets.gen.dart';

class DitolakPertama extends StatelessWidget {
  const DitolakPertama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.images.ditolak1.path),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Data yang disubmit tidak sesuai.Silahkan lakukan input ulang.",
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class DitolakTerakhir extends StatelessWidget {
  const DitolakTerakhir({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.images.ditolak1.path),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Anda telah mencapai batas input. Data yang disubmit tidak sesuai. Harap menghubungi SPV",
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class Diterima extends StatelessWidget {
  const Diterima({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.images.diterima1.path),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Stock Opname berhasil dikonfirmasi.",
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
