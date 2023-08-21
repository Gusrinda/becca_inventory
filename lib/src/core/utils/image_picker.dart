import 'package:becca_supir/src/core/utils/extensions.dart';
import 'package:flimer/flimer.dart';
import 'package:flutter/material.dart';

class ImagePickers {
  static Future<XFile?> show(
    BuildContext context, {
    String title = 'Upload Foto',
  }) async {
    final imageSource = await context.showSelectionBottomSheet<ImageSource>(
      title: title,
      mapLabelData: {
        'Pilih Foto dari Galeri': ImageSource.gallery,
        'Ambil Foto Langsung': ImageSource.camera,
      },
    );

    if (imageSource is ImageSource) {
      return await flimer.pickImage(
        source: imageSource,
        maxWidth: 1024,
        maxHeight: 1024,
      );
    }

    return null;
  }
}
