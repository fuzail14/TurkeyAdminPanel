import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:turkeyadmin/pges_/Dashboard_/dashbrd.dart';
import 'package:turkeyadmin/pges_/widgets/SnackBar_widget.dart';
import '../../Helper/Stringconst.dart';
import '../../Helper/colorsconst.dart';
import '../../widgets/logi_sinupb.dart';
import '../../widgets/mytextformfield.dart';
import '../../widgets/producttextField.dart';

class Packges extends StatefulWidget {
  String coverimages;
  String content;
  String maincatagory;
  Packges(
      {required this.content,
      required this.coverimages,
      required this.maincatagory});

  @override
  State<Packges> createState() => _PackgesState();
}

class _PackgesState extends State<Packges> {
  int packageid = 0;
  void rndommly() {
    packageid = Random().nextInt(1000);
  }

  String formattedDate =
      DateFormat('MMMM, dd, yyy , kk:mm a').format(DateTime.now());
  TextEditingController packagenamecontroler = TextEditingController();
  TextEditingController itemscontroller = TextEditingController();

  TextEditingController dayscontroller = TextEditingController();
  TextEditingController ratingcontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController(text: "\$");
  TextEditingController citynamecontroller = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    print('hamara data');
    print(widget.content);
    print(widget.coverimages);
    print(widget.maincatagory);
    
  
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.800,
            //height: MediaQuery.of(context).size.height * 0.800,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 5,
                color: HexColor('#FFFFFF'),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   width: 20,
                      // ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Package Name:',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MyTextFormField(
                                  fontWeight: FontWeight.w500,
                                  // labelTextColor:secondaryColor ,
                                  // hintTextColor: secondaryColor,

                                  fillColor: HexColor('#F7F7F8'),
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,

                                  //validator: emptyStringValidator,

                                  //controller: controller.subAdminFirstNameController,
                                  controller: packagenamecontroler,
                                  hintText: "Enter Content",
                                  obscureText: false,
                                  //labelText: "Enter Content",
                                  onFocusedBorderColor: HexColor('#F7F7F8'),
                                  onEnabledBorderColor: HexColor('#F7F7F8')),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description:",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MyTextFormField(
                                  fontWeight: FontWeight.w500,
                                  // labelTextColor:secondaryColor ,
                                  // hintTextColor: secondaryColor,

                                  fillColor: HexColor('#F7F7F8'),
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,

                                  //validator: emptyStringValidator,

                                  //controller: controller.subAdminFirstNameController,
                                  controller: descriptioncontroller,
                                  hintText: "Enter Description",
                                  obscureText: false,
                                  labelText: "Enter Description",
                                  onFocusedBorderColor: HexColor('#F7F7F8'),
                                  onEnabledBorderColor: HexColor('#F7F7F8')),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          MyTextFormField(
                              fontWeight: FontWeight.w500,
                              // labelTextColor:secondaryColor ,
                              // hintTextColor: secondaryColor,

                              fillColor: HexColor('#F7F7F8'),
                              width: MediaQuery.of(context).size.width * 0.20,

                              //validator: emptyStringValidator,

                              //controller: controller.subAdminFirstNameController,
                              controller: itemscontroller,
                              hintText: "Enter Items",
                              obscureText: false,
                              //labelText: "Enter Content",
                              onFocusedBorderColor: HexColor('#F7F7F8'),
                              onEnabledBorderColor: HexColor('#F7F7F8')),
                          SizedBox(
                            width: 10,
                          ),
                          MyTextFormField(
                              fontWeight: FontWeight.w500,
                              // labelTextColor:secondaryColor ,
                              // hintTextColor: secondaryColor,

                              fillColor: HexColor('#F7F7F8'),
                              width: MediaQuery.of(context).size.width * 0.20,

                              //validator: emptyStringValidator,

                              //controller: controller.subAdminFirstNameController,
                              controller: dayscontroller,
                              hintText: "Enter Days",
                              obscureText: false,
                              //labelText: "Enter Content",
                              onFocusedBorderColor: HexColor('#F7F7F8'),
                              onEnabledBorderColor: HexColor('#F7F7F8')),
                          SizedBox(
                            width: 10,
                          ),
                          MyTextFormField(
                              fontWeight: FontWeight.w500,
                              // labelTextColor:secondaryColor ,
                              // hintTextColor: secondaryColor,

                              fillColor: HexColor('#F7F7F8'),
                              width: MediaQuery.of(context).size.width * 0.20,

                              //validator: emptyStringValidator,

                              //controller: controller.subAdminFirstNameController,
                              controller: ratingcontroller,
                              hintText: "Enter Rating",
                              obscureText: false,
                              // labelText: "Enter Content",
                              onFocusedBorderColor: HexColor('#F7F7F8'),
                              onEnabledBorderColor: HexColor('#F7F7F8')),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Price:',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MyTextFormField(
                                  fontWeight: FontWeight.w500,
                                  // labelTextColor:secondaryColor ,
                                  // hintTextColor: secondaryColor,

                                  fillColor: HexColor('#F7F7F8'),
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,

                                  //validator: emptyStringValidator,

                                  //controller: controller.subAdminFirstNameController,
                                  controller: pricecontroller,
                                  hintText: "Enter Price",
                                  obscureText: false,
                                  //labelText: "Enter Content",
                                  onFocusedBorderColor: HexColor('#F7F7F8'),
                                  onEnabledBorderColor: HexColor('#F7F7F8')),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "City Name:",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MyTextFormField(
                                  fontWeight: FontWeight.w500,
                                  // labelTextColor:secondaryColor ,
                                  // hintTextColor: secondaryColor,

                                  fillColor: HexColor('#F7F7F8'),
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,

                                  //validator: emptyStringValidator,

                                  //controller: controller.subAdminFirstNameController,
                                  controller: citynamecontroller,
                                  hintText: "Enter City Name",
                                  obscureText: false,
                                  //labelText: "Enter Content",
                                  onFocusedBorderColor: HexColor('#F7F7F8'),
                                  onEnabledBorderColor: HexColor('#F7F7F8')),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      GestureDetector(
                        onTap: () {
                          _upload('gallery');
                        },
                        child: DottedBorder(
                          color: HexColor('#13326E'),
                          strokeWidth: 1,
                          dashPattern: [10, 8],
                          child: Container(
                            // margin:
                            //     EdgeInsets.only(top: 10, bottom: 10),

                            height: 150,

                            width: MediaQuery.of(context).size.width * 0.39,
                            // decoration: BoxDecoration(
                            //     color: AppColors.unselected_c,

                            //         ),

                            child: _pickedImage == null
                                ? Center(
                                    child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                : Image.memory(
                                    webImage,
                                    height: 150,
                                    width: MediaQuery.of(context).size.width *
                                        0.39,
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      log_sigup(
                        height: 50,
                        width: 194,
                        text: "Set Packages",
                        onpressed: () async {
                          rndommly();
                          print("packgeid${packageid}12567${packageid}");
                          FirebaseFirestore firestore =
                              FirebaseFirestore.instance;
                          try {
                            if (mainimages != null &&
                                pricecontroller.text.isNotEmpty &&
                                descriptioncontroller.text.isNotEmpty &&
                                pricecontroller.text.isNotEmpty) {
                              print(packagenamecontroler.text);
                              print(mainimages);
                              print(itemscontroller.text);
                              print(descriptioncontroller.text);
                              print(pricecontroller.text);
                              print(dayscontroller.text);
                              print(ratingcontroller.text);
                              print(citynamecontroller.text);
                              print(widget.maincatagory);
                              print(widget.content);
                              print(widget.coverimages);
                              await firestore
                                  .collection("packages")
                                  .doc("oxgdy${packageid}ygdexy${packageid}")
                                  .set({
                                "packagename": packagenamecontroler.text,
                                "packageimage": mainimages,
                                "items": itemscontroller.text,
                                "day": dayscontroller.text,
                                "rating": ratingcontroller.text,
                                "price": pricecontroller.text,
                                "description": descriptioncontroller.text,
                                "cityname": citynamecontroller.text,
                                "date": formattedDate,
                                "maipackgeimage": widget.coverimages,
                                "mainpackagecontent": widget.content,
                                "maincatagory": widget.maincatagory,
                                "packgeid":
                                    "oxgdy${packageid}ygdexy${packageid}",
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  MySnackbar.successSnackBar(
                                      "${packagenamecontroler.text} are Successfully stored"));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()));
                            }
                          } catch (e) {
                            print(e);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(MySnackbar.ErrorSnackBar("${e}"));
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )),
          ),

          // Text('Package Name'),
          // productfield(
          //   enable: false,
          //   width: null,
          //   height: null,
          //   controller: packagenamecontroler,
          //   text: widget.maincatagory,
          //   textInputType: TextInputType.text,
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     _upload('gallery');
          //   },
          //   child: Container(
          //     height: 200,
          //     // decoration: BoxDecoration(
          //     //     color: AppColors.unselected_c,
          //     //     image: DecorationImage(
          //     //         fit: BoxFit.fill,
          //     //         image: NetworkImage(
          //     //           packageimage == null
          //     //               ? "https://firebasestorage.googleapis.com/v0/b/turkey-app-40705.appspot.com/o/image%2011%20(4).png?alt=media&token=6c12aa3b-6025-4a7a-8ab6-5a8b6d141e00"
          //     //               : packageimage,
          //     //         ))),
          //     child: _pickedImage == null
          //         ? Center(
          //             child: Row(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               loading == true
          //                   ? CircularProgressIndicator()
          //                   : Text(
          //                       'Choose from Gallery',
          //                       style: GoogleFonts.roboto(
          //                           fontSize: 20,
          //                           fontWeight: FontWeight.w700,
          //                           color: Colors.blue),
          //                     ),
          //             ],
          //           ))
          //         : Image.memory(webImage),
          //   ),
          // ),

          // Container(
          //     height: 50,
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Container(
          //             decoration: BoxDecoration(
          //                 border: Border.all(
          //                     width: 1, color: Colors.black)),
          //             height: 30,
          //             width: 100,
          //             child: TextFormField(
          //               controller: itemscontroller,
          //               keyboardType: TextInputType.number,
          //               scrollPadding: EdgeInsets.only(top: 2),
          //               textAlign: TextAlign.left,
          //               decoration: InputDecoration(
          //                   alignLabelWithHint: true,
          //                   hintText: "Items",
          //                   border: InputBorder.none,
          //                   fillColor: AppColors.unselected_c,
          //                   filled: true),
          //             ),
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Container(
          //             decoration: BoxDecoration(
          //                 border: Border.all(
          //                     width: 1, color: Colors.black)),
          //             height: 30,
          //             width: 100,
          //             child: TextFormField(
          //               controller: dayscontroller,
          //               keyboardType: TextInputType.number,
          //               scrollPadding: EdgeInsets.only(top: 2),
          //               textAlign: TextAlign.left,
          //               decoration: InputDecoration(
          //                   alignLabelWithHint: true,
          //                   hintText: "Days",
          //                   border: InputBorder.none,
          //                   fillColor: AppColors.unselected_c,
          //                   filled: true),
          //             ),
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Container(
          //             decoration: BoxDecoration(
          //                 border: Border.all(
          //                     width: 1, color: Colors.black)),
          //             height: 30,
          //             width: 100,
          //             child: TextFormField(
          //               controller: ratingcontroller,
          //               keyboardType: TextInputType.number,
          //               scrollPadding: EdgeInsets.only(top: 2),
          //               textAlign: TextAlign.left,
          //               decoration: InputDecoration(
          //                   alignLabelWithHint: true,
          //                   hintText: "Rating",
          //                   border: InputBorder.none,
          //                   fillColor: AppColors.unselected_c,
          //                   filled: true),
          //             ),
          //           ),
          //         ],
          //       ),
          //     )),

          // Text("Description"),
          // productfield(
          //   width: null,
          //   height: null,
          //   controller: descriptioncontroller,
          //   text: "Description",
          //   textInputType: TextInputType.multiline,
          // ),

          // Text("Price"),
          // productfield(
          //   width: null,
          //   height: null,
          //   controller: pricecontroller,
          //   text: "Price",
          //   textInputType: TextInputType.number,
          // ),
          // Text("City Name"),
          // productfield(
          //   textInputType: TextInputType.text,
          //   width: null,
          //   height: null,
          //   controller: citynamecontroller,
          //   text: "City name",
          // ),
          // SizedBox(
          //   height: 20,
          // ),

          // log_sigup(
          //   text: "Set Packages",
          //   onpressed: () async {
          //     rndommly();
          //     print("packgeid${packageid}12567${packageid}");
          //     FirebaseFirestore firestore = FirebaseFirestore.instance;
          //     try {
          //       if (mainimages != null &&
          //           pricecontroller.text.isNotEmpty &&
          //           descriptioncontroller.text.isNotEmpty &&
          //           pricecontroller.text.isNotEmpty) {
          //         print(packagenamecontroler.text);
          //         print(mainimages);
          //         print(itemscontroller.text);
          //         print(descriptioncontroller.text);
          //         print(pricecontroller.text);
          //         print(dayscontroller.text);
          //         print(ratingcontroller.text);
          //         print(citynamecontroller.text);
          //         print(widget.maincatagory);
          //         print(widget.content);
          //         print(widget.coverimages);
          //         await firestore
          //             .collection("packages")
          //             .doc("oxgdy${packageid}ygdexy${packageid}")
          //             .set({
          //           "packagename": packagenamecontroler.text,
          //           "packageimage": mainimages,
          //           "items": itemscontroller.text,
          //           "day": dayscontroller.text,
          //           "rating": ratingcontroller.text,
          //           "price": pricecontroller.text,
          //           "description": descriptioncontroller.text,
          //           "cityname": citynamecontroller.text,
          //           "date": formattedDate,
          //           "maipackgeimage": widget.coverimages,
          //           "mainpackagecontent": widget.content,
          //           "maincatagory": widget.maincatagory,
          //           "packgeid": "oxgdy${packageid}ygdexy${packageid}",
          //         });
          //         ScaffoldMessenger.of(context).showSnackBar(
          //             MySnackbar.successSnackBar(
          //                 "${packagenamecontroler.text} are Successfully stored"));
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => Dashboard()));
          //       }
          //     } catch (e) {
          //       print(e);
          //       ScaffoldMessenger.of(context)
          //           .showSnackBar(MySnackbar.ErrorSnackBar("${e}"));
          //     }
          //   },
          // )
        ],
      )),
    );
  }

  var mainimages;
  bool loading = false;
  Uint8List webImage = Uint8List(8);
  File? _pickedImage;

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
      var f;
      print('image $fileName');

      if (pickedImage != null) {
        f = await pickedImage.readAsBytes();
        setState(() {
          webImage = f;

          _pickedImage = File('a');
        });
      }
      if (kIsWeb) {
        FirebaseStorage storage = FirebaseStorage.instance;
        Reference _reference =
            storage.ref().child('${path.basename(pickedImage.path)}');
        await _reference
            .putData(
          await pickedImage.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'),
        )
            .whenComplete(() async {
          await _reference.getDownloadURL().then((value) {
            mainimages = value;
          });
        });
      } else {
//write a code for android or ios
      }

      //   try {
      //     FirebaseStorage storage = FirebaseStorage.instance;
      //     // Uploading the selected image with some custom meta data
      //     await storage.ref(fileName).putFile(
      //         imageFile,
      //         SettableMetadata(customMetadata: {
      //           'uploaded_by': 'A bad guy',
      //           'description': 'Some description...'
      //         }));
      //     mainimages = await storage.ref(fileName).getDownloadURL();
      //     print(mainimages);

      //     // Refresh the UI
      //     setState(() {});
      //   } on FirebaseException catch (error) {
      //     if (kDebugMode) {
      //       print('catch error $error');
      //     }
      //   }
      // }
    } catch (err) {
      if (kDebugMode) {
        print('catch err $err');
      }
      setState(() {
        loading = false;
      });
    }
  }
  // var packageimage;
  // bool loading = false;

  // Future<void> _upload(String inputSource) async {
  //   final picker = ImagePicker();
  //   XFile? pickedImage;
  //   setState(() {
  //     loading = true;
  //   });
  //   try {
  //     pickedImage = await picker.pickImage(
  //         source: inputSource == 'camera'
  //             ? ImageSource.camera
  //             : ImageSource.gallery,
  //         maxWidth: 1920);

  //     final String fileName = path.basename(pickedImage!.path);
  //     File imageFile = File(pickedImage.path);
  //     print('Usama$fileName');

  //     try {
  //       FirebaseStorage storage = FirebaseStorage.instance;
  //       // Uploading the selected image with some custom meta data
  //       await storage.ref(fileName).putFile(
  //           imageFile,
  //           SettableMetadata(customMetadata: {
  //             'uploaded_by': 'A bad guy',
  //             'description': 'Some description...'
  //           }));
  //       packageimage = await storage.ref(fileName).getDownloadURL();
  //       print(packageimage);

  //       // Refresh the UI
  //       setState(() {});
  //     } on FirebaseException catch (error) {
  //       if (kDebugMode) {
  //         print(error);
  //       }
  //     }
  //   } catch (err) {
  //     if (kDebugMode) {
  //       print(err);
  //     }
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  // }

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
