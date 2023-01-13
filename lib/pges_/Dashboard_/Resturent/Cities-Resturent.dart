import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:turkeyadmin/pges_/Dashboard_/Resturent/resturent_subcatagory.dart';
import 'package:turkeyadmin/pges_/Dashboard_/guides/subguides.dart';
import '../../Helper/colorsconst.dart';
import '../../widgets/SnackBar_widget.dart';
import '../../widgets/logi_sinupb.dart';
import '../../widgets/producttextField.dart';
import 'TopResturent-cities.dart';

class cities_wiseresturents extends StatefulWidget {
  String cityname;
  String cityimage;
  cities_wiseresturents({required this.cityimage, required this.cityname});
  @override
  State<cities_wiseresturents> createState() => _cities_wiseresturentsState();
}

class _cities_wiseresturentsState extends State<cities_wiseresturents> {
  var newlatlang;
  String formattedDate =
      DateFormat('MMMM, dd, yyy , kk:mm a').format(DateTime.now());
  TextEditingController cityname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationConfiguration.staggeredGrid(
        position: 2,
        duration: const Duration(microseconds: 100),
        columnCount: 1,
        child: ScaleAnimation(
          child: FadeInAnimation(
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    "Recomeneded Resturent",
                    style: GoogleFonts.merriweather(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Resturent Name"),
                  SizedBox(
                    height: 20,
                  ),
                  productfield(
                    width: null,
                    height: null,
                    controller: cityname,
                    text: "Resturent Name",
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Resturent Image'),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      _upload('gallery');
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: AppColors.unselected_c,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                topresturent == null
                                    ? "https://firebasestorage.googleapis.com/v0/b/turkey-app-40705.appspot.com/o/image%2011%20(4).png?alt=media&token=6c12aa3b-6025-4a7a-8ab6-5a8b6d141e00"
                                    : topresturent,
                              ))),
                      child: topresturent == null
                          ? Center(
                              child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                loading == false
                                    ? Text(
                                        'Choose from Gallery',
                                        style: GoogleFonts.roboto(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.blue),
                                      )
                                    : CircularProgressIndicator()
                              ],
                            ))
                          : null,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  log_sigup(
                    text: "Top Resturent",
                    onpressed: () async {
                      FirebaseFirestore firestore = FirebaseFirestore.instance;
                      try {
                        if (topresturent != null && cityname.text.isNotEmpty) {
                          await firestore
                              .collection("resturent-in-cities")
                              .add({
                            "resturentimage": topresturent,
                            "resturentname": cityname.text,
                            "date": formattedDate,
                            "cityname": widget.cityname,
                            "cityiamge": widget.cityimage,
                          });
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                            MySnackbar.successSnackBar("Store successully"));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => returentproducts(
                                      cityname:widget.cityname,
                                      cityimage:widget.cityimage,
                                      resturentimage:topresturent,
                                      resturentname:cityname.text,
                                    )));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            MySnackbar.ErrorSnackBar("Some thing went wrong"));
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }

  var topresturent;
  bool loading = false;

  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    setState(() {
      loading = true;
    });
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);
      print('Usama$fileName');

      try {
        FirebaseStorage storage = FirebaseStorage.instance;
        // Uploading the selected image with some custom meta data
        await storage.ref(fileName).putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': 'A bad guy',
              'description': 'Some description...'
            }));
        topresturent = await storage.ref(fileName).getDownloadURL();
        print(topresturent);

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
      setState(() {
        loading = false;
      });
    }
  }

  uploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    PickedFile? image;
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = await _imagePicker.getImage(source: ImageSource.gallery);
      var file = File(image!.path);

      if (image != null) {
        setState(() {
          loading = true;
        }); //Upload to Firebase
        UploadTask uploadTask = (await _firebaseStorage
            .ref()
            .child(image.toString())
            .child('image')) as UploadTask;
        var downloadUrl = await uploadTask;
        print(downloadUrl);
        setState(() {
          image = downloadUrl as PickedFile?;
        });
      } else {
        print('No Image Path Received');
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
    loading = false;
  }
}
