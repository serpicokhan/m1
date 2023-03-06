import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class FilePicker extends StatefulWidget {
  FilePicker({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _FilePicker createState() => _FilePicker();
}

class _FilePicker extends State<FilePicker> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
      });
    } on PlatformException catch (e) {
      print('Error: $e');
    }
  }

  void _uploadImage() {
    if (_image != null) {
      final File file = File(_image!.path);
      // TODO: Implement file upload logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_image != null)
              Image.file(
                File(_image!.path),
                height: 200,
              )
            else
              Text('No image selected.'),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Select an image'),
            ),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload image'),
            ),
          ],
        ),
      ),
    );
  }
}
