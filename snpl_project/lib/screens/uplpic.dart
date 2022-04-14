// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snpl_project/screens/picverify.dart';

class UploadPic extends StatefulWidget {
  const UploadPic({Key? key}) : super(key: key);

  @override
  State<UploadPic> createState() => _UploadPicState();
}

class _UploadPicState extends State<UploadPic> {
  File? image;
  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() => this.image = imageTemporary);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 40,
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
              width: size.width + 10,
              child: Image(image: AssetImage('assets/Upload.png'))),
          SizedBox(
            height: size.height * 0.03,
          ),
          Center(
            child: Text(
              "Upload your photo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "upload your photo.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black54),
                ),
                Text(
                  "This is different from account verification",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black54),
                ),
                Text(
                  "which you might have completed",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black54),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PicUpl())),
              //pickImage(ImageSource.camera),
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                primary: Color(0xff9B4BFF),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.342,
                    vertical: size.height * 0.02),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
