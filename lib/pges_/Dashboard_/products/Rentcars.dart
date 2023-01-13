import 'dart:io';
import 'dart:math';

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
import 'package:turkeyadmin/pges_/Dashboard_/dashbrd.dart';
import 'package:turkeyadmin/pges_/widgets/SnackBar_widget.dart';
import '../../Helper/Stringconst.dart';
import '../../Helper/colorsconst.dart';
import '../../widgets/logi_sinupb.dart';
import '../../widgets/producttextField.dart';

class Rentcars extends StatefulWidget {
  String coverimages;
  String content;
  String maincatagory;
  Rentcars(
      {required this.content,
        required this.coverimages,
        required this.maincatagory});
  @override
  State<Rentcars> createState() => _RentcarsState();
}

class _RentcarsState extends State<Rentcars> {
  int rentcarid = 0;
  void rndommly() {
    rentcarid = Random().nextInt(10000);
  }
  String formattedDate =
  DateFormat('MMMM, dd, yyy , kk:mm a').format(DateTime.now());
  TextEditingController carnamecontroller = TextEditingController();
  TextEditingController seatscontroller = TextEditingController();

  TextEditingController dayscontroller = TextEditingController();
  TextEditingController ccvcontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController(text:"\$");
  TextEditingController citynamecontroller = TextEditingController();

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
              padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Car Name'),
                      productfield(
                        width: null,
                        height: null,
                        controller: carnamecontroller,
                        text: "Car Name",
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Car Image"),
                      SizedBox(height:10,),
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
                                    packageimage == null
                                        ? "https://firebasestorage.googleapis.com/v0/b/turkey-app-40705.appspot.com/o/image%2011%20(4).png?alt=media&token=6c12aa3b-6025-4a7a-8ab6-5a8b6d141e00"
                                        : packageimage,
                                  ))),
                          child: packageimage == null
                              ? Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  loading == true
                                      ? CircularProgressIndicator()
                                      : Text(
                                    'Choose from Gallery',
                                    style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.blue),
                                  ),
                                ],
                              ))
                              : null,
                        ),
                      ),
                      Container(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  height: 30,
                                  width: 100,
                                  child: TextFormField(
                                    controller: seatscontroller,
                                    keyboardType: TextInputType.number,
                                    scrollPadding: EdgeInsets.only(top: 2),
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                        alignLabelWithHint: true,
                                        hintText: "Seats",
                                        border: InputBorder.none,
                                        fillColor: AppColors.unselected_c,
                                        filled: true),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  height: 30,
                                  width: 100,
                                  child: TextFormField(
                                    controller: dayscontroller,
                                    keyboardType: TextInputType.number,
                                    scrollPadding: EdgeInsets.only(top: 2),
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                        alignLabelWithHint: true,
                                        hintText: "Days",
                                        border: InputBorder.none,
                                        fillColor: AppColors.unselected_c,
                                        filled: true),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  height: 30,
                                  width: 100,
                                  child: TextFormField(
                                    controller: ccvcontroller,
                                    keyboardType: TextInputType.number,
                                    scrollPadding: EdgeInsets.only(top: 2),
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                        alignLabelWithHint: true,
                                        hintText: "CCV",
                                        border: InputBorder.none,
                                        fillColor: AppColors.unselected_c,
                                        filled: true),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Text("About car Description"),
                      productfield(
                        width: null,
                        height: null,
                        controller: descriptioncontroller,
                        text: "Description",
                        textInputType: TextInputType.multiline,
                      ),
                      SizedBox(height:10,),
                      Text(" car rent Price"),
                      productfield(
                        width: null,
                        height: null,
                        controller: pricecontroller,
                        text: "Price",
                        textInputType: TextInputType.number,
                      ),
                      Text("City Name"),
                      productfield(
                        textInputType: TextInputType.text,
                        width: null,
                        height: null,
                        controller: citynamecontroller,
                        text: "City name",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      log_sigup(
                        text: "Set Rent car",
                        onpressed: () async {
                          var random=Random().nextInt(200);
                          print(random);
                            print('object');
                          FirebaseFirestore firestore=FirebaseFirestore.instance;
                          try{
                            if(packageimage!=null&&carnamecontroller.text.isNotEmpty&&descriptioncontroller.text.isNotEmpty&&pricecontroller.text.isNotEmpty){
                              print(carnamecontroller.text);
                              print(packageimage);
                              print(seatscontroller.text);
                              print(descriptioncontroller.text);
                              print(pricecontroller.text);
                              print(dayscontroller.text);
                              print(ccvcontroller.text);
                              print(citynamecontroller.text);
                              print(widget.maincatagory);
                              print(widget.content);
                              print(widget.coverimages);
                              await firestore.collection("rentcar").add({
                                "carname":carnamecontroller.text,
                                "carimage":packageimage,
                                "seats":seatscontroller.text,
                                "day":dayscontroller.text,
                                "ccv":ccvcontroller.text,
                                "price": pricecontroller.text,
                                "cardescription":descriptioncontroller.text,
                                "cityname":citynamecontroller.text,
                                "date":formattedDate,
                                "maipackgeimage":widget.coverimages,
                                "mainpackagecontent":widget.content,
                                "maincatagory":widget.maincatagory,
                                "rentcarid":"oxgdy${rentcarid}ygdexy${rentcarid}"

                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  MySnackbar.successSnackBar(
                                      "${carnamecontroller.text} are Successfully stored"));
                              Navigator.push(context, MaterialPageRoute(builder:(context)=>
                                  Dashboard()
                              ));
                            }
                          }catch(e){
                            print(e);
                            ScaffoldMessenger.of(context).showSnackBar(
                                MySnackbar.ErrorSnackBar(
                                    "${e}"));

                          }
                        },
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  var packageimage;
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
        packageimage = await storage.ref(fileName).getDownloadURL();
        print(packageimage);

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
