import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

import 'package:image_picker/image_picker.dart';
import '../../Helper/colorsconst.dart';
import '../../widgets/SnackBar_widget.dart';
import '../../widgets/logi_sinupb.dart';
import '../../widgets/producttextField.dart';

class moresubcatagory extends StatefulWidget {
  String? subguidesname;
  moresubcatagory({
    required this.subguidesname,
  });
  @override
  State<moresubcatagory> createState() => _moresubcatagoryState();
}

class _moresubcatagoryState extends State<moresubcatagory> {
  int randomnumber = 0;
  void randomnumbers() {
    randomnumber = Random().nextInt(100);
  }

  String formattedDate =
      DateFormat('MMMM, dd, yyy , kk:mm a').format(DateTime.now());
  TextEditingController sbuguidesproductname = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

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
                    "Add Product",
                    style: GoogleFonts.merriweather(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Product name'),
                  SizedBox(
                    height: 20,
                  ),
                  productfield(
                    width: null,
                    height: null,
                    controller: sbuguidesproductname,
                    text: "Product name",
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Product Images'),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      _upload('gallery');
                    },
                    child: Container(
                      height: 200,
                      // decoration: BoxDecoration(
                      //     color: AppColors.unselected_c,
                      //     image: DecorationImage(
                      //         fit: BoxFit.fill,
                      //         image: NetworkImage(
                      //           subguidesimage == null
                      //               ? "https://firebasestorage.googleapis.com/v0/b/turkey-app-40705.appspot.com/o/scaled_image_picker1433691415044144219.jpg?alt=media&token=1ada9b1f-7b58-4d81-b398-725bc4362d09"
                      //               : subguidesimage,
                      //         ))),
                      child: _pickedImage == null
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
                          : Image.memory(webImage),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  productfield(
                    width: null,
                    height: null,
                    controller: descriptioncontroller,
                    text: "Description",
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  log_sigup(
                    text: "Set Guides",
                    onpressed: () async {
                      randomnumbers();
                      print(randomnumber);
                      FirebaseFirestore firestore = FirebaseFirestore.instance;
                      try {
                        if (subguidesimage != null &&
                            sbuguidesproductname.text.isNotEmpty) {
                          await firestore
                              .collection("subguidesproduct")
                              .doc(double.parse(randomnumber.toString())
                                  .toString())
                              .set({
                            "subguidesproductimage": subguidesimage,
                            "subguidesproductname": sbuguidesproductname.text,
                            "date": formattedDate,
                            "Productid": randomnumber.toString(),
                            "description": descriptioncontroller.text,
                            "catagoryname": widget.subguidesname,
                          });
                        }
                        print(widget.subguidesname);
                        ScaffoldMessenger.of(context).showSnackBar(
                            MySnackbar.successSnackBar("Store successully"));
                      } catch (e) {
                        print(e);
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

  var subguidesimage;

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
            subguidesimage = value;
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
  //       subguidesimage = await storage.ref(fileName).getDownloadURL();
  //       print(subguidesimage);

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
}
