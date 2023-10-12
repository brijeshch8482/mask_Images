import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_celebrare/MyTheme.dart';
import 'package:flutter_celebrare/mainscreen_provider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:widget_mask/widget_mask.dart';
import 'dialog.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  File? selectedFile;

  @override
  Widget build(BuildContext context) {
    return Consumer<IdNotifier>(
      builder: (BuildContext context, idNotifier, Widget? child) {

        return Scaffold(
          backgroundColor: Theme.of(context).canvasColor,
          appBar: AppBar(
            leading: BackButton(
                onPressed: (){
                  SystemNavigator.pop();
                }
            ),
            centerTitle: true,
            title: Text("Add Image / Icon",style: TextStyle(
                color: Theme.of(context).textTheme.titleLarge?.color),
            ),
          ),
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 110,
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  padding: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Theme.of(context).highlightColor
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(15.0))),
                  child: Column(
                    children: [
                      const Center(
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Upload Image",
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          )),
                      ElevatedButton(
                          onPressed: () {

                            pickFromGallery();
                          },
                          child: const Text("Choose from Device")),

                    ],
                  ),
                ),
              ),

              maskImage(selectedFile, idNotifier.getId),

            ],
          ),
        );
      }
    );
  }

  Widget maskImage(croppedImage, int id) {
    if(croppedImage != null) {

      if (id == 1) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
              width: 150,
              height: 250,
              child: WidgetMask(
                blendMode: BlendMode.srcATop,
                childSaveLayer: true,
                mask: Image.file(
                  croppedImage,
                  fit: BoxFit.cover,
                ),
                child: Image.asset('assets/images/user_image_frame_1.png'),

              )
          ),
        );
      } else if (id == 2) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
              width: 150,
              height: 250,
              child: WidgetMask(
                blendMode: BlendMode.srcATop,
                childSaveLayer: true,
                mask: Image.file(
                  croppedImage,
                  fit: BoxFit.cover,
                ),
                child: Image.asset('assets/images/user_image_frame_2.png'),

              )
          ),
        );
      } else if (id == 3) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
              width: 150,
              height: 250,
              child: WidgetMask(
                blendMode: BlendMode.srcATop,
                childSaveLayer: true,
                mask: Image.file(
                  croppedImage,
                  fit: BoxFit.cover,
                ),
                child: Image.asset('assets/images/user_image_frame_3.png'),

              )
          ),
        );
      } else if (id == 4) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
              width: 150,
              height: 250,
              child: WidgetMask(
                blendMode: BlendMode.srcATop,
                childSaveLayer: true,
                mask: Image.file(
                  croppedImage,
                  fit: BoxFit.cover,
                ),
                child: Image.asset('assets/images/user_image_frame_4.png'),

              )
          ),
        );
      } else {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.file(
              croppedImage!,
              width: 150,
              height: 250,
              fit: BoxFit.cover,
            )
        );
      }
    }
    else {
      return const Text("");
    }
  }

   pickFromGallery() async {
    try {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage == null) return;

      final croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: MyTheme.darkGreen,
              toolbarWidgetColor: Colors.white,
              activeControlsWidgetColor: MyTheme.darkGreen,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );

      if (croppedImage == null) return;

      final croppedFile = File(croppedImage.path);

      selectedFile = croppedFile;


      setState(() {
        openDialog();
      });


    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to pick or crop image: $e");
      }
    }
  }

  openDialog() async{

    await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(selectedFile);
        });


  }

}
