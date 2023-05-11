import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cameraapp/galleryscreen.dart';

XFile? image;
String? imagepath;
ValueNotifier<List> galleryNotifier = ValueNotifier([]);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  getImage(source: ImageSource.camera);

                  const Icon(Icons.camera_alt_outlined);
                },
                child: const Text('Camera')),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const GalleryScreen();
                    },
                  ));
                },
                child: const Text('Gallery')),
          ],
        ),
      ),
    );
  }

  getImage({required ImageSource source}) async {
    image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      setState(() {
        imagepath = (image!.path);
        add();
      });
    } else {
      return null;
    }
  }
}
