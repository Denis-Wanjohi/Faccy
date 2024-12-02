import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _imagefile = null;
  late List<Face> faces;
  bool isLoading = false;
  late ui.Image _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (_imagefile == null)
              ? Center(
                  child: Text("no image selected"),
                )
              : Center(
                  child: FittedBox(
                    child: SizedBox(
                      width: _image.width.toDouble(),
                      height: _image.height.toDouble(),
                      child: CustomPaint(
                          // painter: FacePainter(_image, faces),
                          ),
                    ),
                  ),
                ),
    );
  }

  void _getImage() async {
    final imageFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      isLoading = true;
    });
    print(imageFile?.name);
    print(imageFile?.path);
    final image = FirebaseVisionImage.fromFile(File(imageFile!.name));
    final faceDetector = FirebaseVision.instance.faceDetector();
    List<Face> faces = await faceDetector.processImage(image);
    // print(faces);
  }
}
