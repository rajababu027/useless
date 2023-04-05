import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class useless extends StatefulWidget {
  const useless({super.key});

  @override
  State<useless> createState() => _uselessState();
}

class _uselessState extends State<useless> {
   File ?_image;
  final picker = ImagePicker();
  Future getImager() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (PickedFile != null) {
        _image = File(pickedImage!.path);
      } else {
        print("no image selected");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return
Scaffold(
      body: Center(
        child: _image == null ? Text('No image selected') : Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImager();
        },
        child: Icon(Icons.photo),
      ),
    );
  }
}
