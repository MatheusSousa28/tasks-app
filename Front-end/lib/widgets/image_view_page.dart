import 'dart:io';
import 'package:flutter/material.dart';

class ImageViewPage extends StatelessWidget {
  const ImageViewPage({super.key, required this.imageFile});

  final File imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.file(imageFile),
        ),
      ),
    );
  }
}
