import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class ImagePickerHomeScreen extends StatefulWidget {
  const ImagePickerHomeScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerHomeScreen> createState() => _ImagePickerHomeScreenState();
}

class _ImagePickerHomeScreenState extends State<ImagePickerHomeScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBaseAppBar(),
      body: mainBody(),
    );
  }

  BaseAppBar buildBaseAppBar() {
    return BaseAppBar(
      title: Text(
        'Demo Image Picker',
        style: verificationTitle,
      ),
      elevations: 4,
      shadowColor: AppColor.baseAppBar,
    );
  }

  Widget mainBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text(
                "Pick Image from Gallery",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                pickImage();
              },
            ),
            ElevatedButton(
              child: const Text(
                "Pick Image from Camera",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                pickImageCamera();
              },
            ),
            30.h.verticalSpace,
            image != null
                ? Image.file(
                    image!,
                  )
                : const Text(
                    "No image selected",
                  ),
          ],
        ),
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}

// There are 4 ways of getting the ImageProvider
/*
Image.asset(name) is essentially Image(image: AssetImage(name)),
Image.file(path) is essentially Image(image: FileImage(File(path))),
Image.network(url) is essentially Image(image: NetworkImage(url)),
Image.memory(list) is essentially Image(image: MemoryImage(list))
*/
