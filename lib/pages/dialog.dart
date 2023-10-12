import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_mask/widget_mask.dart';

import '../mainscreen_provider.dart';


class CustomDialog extends StatefulWidget {
  final File? croppedImage;

  const CustomDialog( this.croppedImage,{super.key});


  @override
  State<CustomDialog> createState() => CustomDialogState();

}

class CustomDialogState extends State<CustomDialog>{


  int myId= 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<IdNotifier>(
      builder: (BuildContext context, idNotifier, Widget? child) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: dialogContent(context, widget.croppedImage, idNotifier)
        );
      },
    );
  }

  dialogContent(BuildContext context, croppedImage, IdNotifier idNotifier) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                  onTap: (){
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: const Icon(Icons.cancel)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Text("Uploaded Image",style: TextStyle(
                fontSize: 20
            ),),
          ),
          maskImage(myId, croppedImage),
          Row(
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    myId = 0;
                  });
                },
                child: Container(
                    margin: const EdgeInsets.only(top: 15,left: 15,right: 1,bottom: 5),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).highlightColor,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: const Text("Orignal",style: TextStyle(fontSize: 12.0),)
                ),
              ),
              InkWell(
                onTap: (){

                  setState(() {
                    myId= 1;
                  });
                },
                child: Container(
                    margin: const EdgeInsets.only(top: 15,left: 2,right: 1,bottom: 5),
                    padding: const EdgeInsets.all(5.0),

                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).highlightColor,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: Image(image: const ResizeImage(
                      AssetImage('assets/images/user_image_frame_1.png'),
                      width: 28,
                      height: 25,
                    ),
                      color: Theme.of(context).highlightColor,
                    )

                ),
              ),
              InkWell(
                onTap: (){

                  setState(() {
                    myId = 2;
                  });
                },
                child: Container(
                    margin: const EdgeInsets.only(top: 15,left: 2,right: 1,bottom: 5),
                    padding: const EdgeInsets.all(5.0),

                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).highlightColor,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: Image(image: const ResizeImage(
                      AssetImage('assets/images/user_image_frame_2.png'),
                      width: 30,
                      height: 30,
                    ),
                      color: Theme.of(context).highlightColor,
                    )

                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    myId = 3;
                  });

                },
                child: Container(
                    margin: const EdgeInsets.only(top: 15,left: 2,right: 1,bottom: 5),
                    padding: const EdgeInsets.all(5.0),

                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).highlightColor,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: Image(image: const ResizeImage(
                      AssetImage('assets/images/user_image_frame_3.png'),
                      width: 30,
                      height: 30,
                    ),
                      color: Theme.of(context).highlightColor,
                    )

                ),
              ),
              InkWell(
                onTap: (){

                  setState(() {
                    myId = 4;
                  });

                },
                child: Container(
                    margin: const EdgeInsets.only(top: 15,left: 2,right: 1,bottom: 5),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).highlightColor,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: Image(image: const ResizeImage(
                      AssetImage('assets/images/user_image_frame_4.png'),
                      width: 30,
                      height: 20,
                    ),
                      color: Theme.of(context).highlightColor,
                    )

                ),
              ),

            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: 200,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: Theme.of(context).elevatedButtonTheme.style?.backgroundColor,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      )
                  )
              ),
              onPressed: () {
                if(myId == 1){
                  setState(() {
                    idNotifier.setId = 1;
                  });
                  Navigator.pop(context,myId);
                }else if(myId == 2){
                  setState(() {
                    idNotifier.setId = 2;
                  });
                  Navigator.pop(context,myId);
                }else if(myId == 3){
                  setState(() {
                    idNotifier.setId = 3;
                  });
                  Navigator.pop(context,myId);
                }else if(myId == 4){
                  setState(() {
                    idNotifier.setId = 4;
                  });
                  Navigator.pop(context,myId);
                }else{
                  setState(() {
                    idNotifier.setId = 0;
                  });
                  Navigator.pop(context,myId);
                }
              },
              child: const Text('Use this image'),
            ),
          )
        ],
      ),
    );
  }

Widget maskImage(id, croppedImage){
  if(id == 1) {
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
  }else if(id == 2){
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
  }else if(id == 3){
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
  }else if(id == 4){
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
  }else{
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

}