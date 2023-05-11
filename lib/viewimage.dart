import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cameraapp/galleryscreen.dart';

import 'mainscreen.dart';

class ViewImage extends StatelessWidget {
   ViewImage({super.key, required this.imgIndex});
  int imgIndex;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Gallery'),
          actions: [
            IconButton(
                onPressed: () {
                  delete(imgIndex);
                
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Center(
          child: Image.file(
            File(galleryNotifier.value[imgIndex]),
          ),
        ));
  }
  
  
}
