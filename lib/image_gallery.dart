import 'dart:io';
import 'package:activity_5/chooser.dart';
import 'package:flutter/material.dart';


class ImageGallery extends StatefulWidget {
  const ImageGallery({Key? key}) : super(key: key);

  @override
  ImageGalleryState createState() => ImageGalleryState();
}
class ImageGalleryState extends State<ImageGallery> {

  File? image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Image Gallery'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 350,
              height: 350,
              child: image != null ? Image.file(image!) :
              const Text('No image selected.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30)),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {\
            var selectedImage = await chooser();
            setState(() {
              image = selectedImage;
            });
        }
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
