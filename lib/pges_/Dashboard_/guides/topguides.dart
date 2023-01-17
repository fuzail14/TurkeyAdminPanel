import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:turkeyadmin/pges_/Dashboard_/dashbrd.dart';
import 'package:turkeyadmin/pges_/Dashboard_/guides/subguides.dart';
import '../../Helper/colorsconst.dart';
import '../../widgets/SnackBar_widget.dart';
import '../../widgets/logi_sinupb.dart';
import '../../widgets/mytextformfield.dart';
import '../../widgets/producttextField.dart';

class topguides extends StatefulWidget {
  String? coverimages;
  String? content;
  String? maincatagory;
  topguides(
      {required this.content,
      required this.coverimages,
      required this.maincatagory});
  @override
  State<topguides> createState() => _topguidesState();
}

class _topguidesState extends State<topguides> {
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
                    "Add Cities",
                    style: GoogleFonts.merriweather(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.800,
                    height: MediaQuery.of(context).size.height * 0.570,
                    child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        color: HexColor('#FFFFFF'),
                        child: Center(
                          child: Column(
                            children: [
                              // SizedBox(
                              //   width: 20,
                              // ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'City Name:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MyTextFormField(
                                      fontWeight: FontWeight.w500,
                                      // labelTextColor:secondaryColor ,
                                      // hintTextColor: secondaryColor,

                                      fillColor: HexColor('#F7F7F8'),
                                      width: MediaQuery.of(context).size.width *
                                          0.39,

                                      //validator: emptyStringValidator,

                                      //controller: controller.subAdminFirstNameController,
                                      controller: cityname,
                                      hintText: "Enter City",
                                      obscureText: false,
                                      labelText: "Enter City",
                                      onFocusedBorderColor: HexColor('#F7F7F8'),
                                      onEnabledBorderColor:
                                          HexColor('#F7F7F8')),
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
                                    height: 150,

                                    width: MediaQuery.of(context).size.width *
                                        0.39,

                                    // decoration: BoxDecoration(
                                    //     color: AppColors.unselected_c,
                                    //     image: DecorationImage(
                                    //         fit: BoxFit.fill,
                                    //         image: NetworkImage(
                                    //           cityimage == null
                                    //               ? "https://firebasestorage.googleapis.com/v0/b/turkey-app-40705.appspot.com/o/image%2011%20(4).png?alt=media&token=6c12aa3b-6025-4a7a-8ab6-5a8b6d141e00"
                                    //               : cityimage,
                                    //         ))),
                                    child: _pickedImage == null
                                        ? Center(
                                            child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              loading == false
                                                  ? Text(
                                                      'Choose from Gallery',
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.blue),
                                                    )
                                                  : CircularProgressIndicator()
                                            ],
                                          ))
                                        : Image.memory(webImage),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              log_sigup(
                                height: 50,
                                width: 194,
                                text: "Set Guides",
                                onpressed: () async {
                                  FirebaseFirestore firestore =
                                      FirebaseFirestore.instance;
                                  try {
                                    if (cityimages != null &&
                                        cityname.text.isNotEmpty) {
                                      await firestore.collection("cities").add({
                                        "cityimage": cityimages,
                                        "cityname": cityname.text,
                                        "date": formattedDate,
                                      });
                                    }
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        MySnackbar.successSnackBar(
                                            "Store successully"));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => subguides(
                                                  cityimage: cityimages,
                                                  cityname: cityname.text,
                                                )));
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        MySnackbar.ErrorSnackBar(
                                            "Some thing went wrong"));
                                  }
                                },
                              ),

                              // Align(
                              //   alignment: Alignment.bottomRight,
                              //   child: ElevatedButton(
                              //       style: ElevatedButton.styleFrom(
                              //           minimumSize: Size(30, 30),

                              //           ),
                              //       onPressed: () {},
                              //       child: Text('Submit')),
                              // )

                              // productfield(
                              //   textInputType: TextInputType.text,
                              //   width: null,
                              //   text: 'Content',

                              //   height: null,
                              // ),
                            ],
                          ),
                        )),
                  ),

                  // Text('City Name'),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // productfield(
                  //   width: null,
                  //   height: null,
                  //   controller: cityname,
                  //   text: "City Name",
                  //   textInputType: TextInputType.text,
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Text('City Images'),
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
                  //     //           cityimage == null
                  //     //               ? "https://firebasestorage.googleapis.com/v0/b/turkey-app-40705.appspot.com/o/image%2011%20(4).png?alt=media&token=6c12aa3b-6025-4a7a-8ab6-5a8b6d141e00"
                  //     //               : cityimage,
                  //     //         ))),
                  //     child: _pickedImage == null
                  //         ? Center(
                  //             child: Row(
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               loading == false
                  //                   ? Text(
                  //                       'Choose from Gallery',
                  //                       style: GoogleFonts.roboto(
                  //                           fontSize: 20,
                  //                           fontWeight: FontWeight.w700,
                  //                           color: Colors.blue),
                  //                     )
                  //                   : CircularProgressIndicator()
                  //             ],
                  //           ))
                  //         : Image.memory(webImage),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }

  List<String> _listHorizontal = [
    "shopping",
    "historical places",
    "Admireable places",
    "Msidecine",
    "Please one subcatagory"
  ];

  var cityimages;
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
            cityimages = value;
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

  // var cityimage;
  var citycatagoryimage;
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
  //       cityimage = await storage.ref(fileName).getDownloadURL();
  //       print(cityimage);

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

  Future<void> cityupload(String inputSource) async {
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
        citycatagoryimage = await storage.ref(fileName).getDownloadURL();
        print(citycatagoryimage);

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
