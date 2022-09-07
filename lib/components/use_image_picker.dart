import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UseImagePicker extends StatefulWidget {
  final void Function(File _image) onImagePicker;
  const UseImagePicker({Key? key, required this.onImagePicker})
      : super(key: key);

  @override
  State<UseImagePicker> createState() => _UseImagePickerState();
}

class _UseImagePickerState extends State<UseImagePicker> {
  File? _image;

  Future<void> imagePicker() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
      widget.onImagePicker(_image!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              maxRadius: 35,
              backgroundColor: Color.fromARGB(255, 146, 66, 160),
              backgroundImage: _image != null ? FileImage(_image!) : null,
            ),
            Positioned(
              left: 50,
              right: 0,
              top: 53,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  imagePicker();
                  print(_image);
                },
                child: const Icon(Icons.image),
              ),
            )
          ],
        )
      ],
    );
  }
}
