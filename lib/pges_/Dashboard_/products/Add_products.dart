import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:turkeyadmin/pges_/Dashboard_/dashbrd.dart';
import 'package:turkeyadmin/pges_/Dashboard_/guides/topguides.dart';
import '../../Helper/Stringconst.dart';
import '../../Helper/colorsconst.dart';
import '../../Helper/images.dart';
import '../../widgets/Appbrwidget.dart';
import '../../widgets/SnackBar_widget.dart';
import '../../widgets/mytextformfield.dart';
import '../../widgets/producttextField.dart';
import '../Resturent/TopResturent-cities.dart';
import 'Medicine.dart';
import 'Pacakges.dart';
import 'Rentcars.dart';

class Addproducts extends StatefulWidget {
  @override
  State<Addproducts> createState() => _AddproductsState();
}

class _AddproductsState extends State<Addproducts> {
  String formattedDate =
      DateFormat('MMMM, dd, yyy , kk:mm a').format(DateTime.now());
  TextEditingController contentconroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110),
          child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Center(
                  child: Text(
                'Add Products',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ))),
        ),
        body: AnimationConfiguration.staggeredGrid(
          position: 2,
          duration: const Duration(microseconds: 100),
          columnCount: 1,
          child: ScaleAnimation(
            child: FadeInAnimation(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.800,
                        height: MediaQuery.of(context).size.height * 0.520,
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                            color: HexColor('#FFFFFF'),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10,top:10),
                              child: Column(
                                children: [
                                  // SizedBox(
                                  //   width: 20,
                                  // ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Content:',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0,
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0,
                                                0,
                                                0),
                                            child: MyTextFormField(
                                                fontWeight: FontWeight.w500,
                                                // labelTextColor:secondaryColor ,
                                                // hintTextColor: secondaryColor,

                                                fillColor: HexColor('#F7F7F8'),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.39,

                                                //validator: emptyStringValidator,

                                                //controller: controller.subAdminFirstNameController,
                                                controller: contentconroller,
                                                hintText: "Enter Content",
                                                obscureText: false,
                                                labelText: "Enter Content",
                                                onFocusedBorderColor:
                                                    HexColor('#F7F7F8'),
                                                onEnabledBorderColor:
                                                    HexColor('#F7F7F8')),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Main Catagory",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                              height: 50,
                                              color: HexColor('#F7F7F8'),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${_listHorizontal[_indexHorizontal]}',
                                                      textAlign: TextAlign.left,
                                                      style: GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 15),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        print(formattedDate);
                                                        ShowBottomsheet(context);
                                                      },
                                                      child: Icon(Icons
                                                          .arrow_forward_ios),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  Row(
                                    children: [
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

                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.39,
                                            // decoration: BoxDecoration(
                                            //     color: AppColors.unselected_c,

                                            //         ),

                                            child: _pickedImage == null
                                                ? Center(
                                                    child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      loading == true
                                                          ? CircularProgressIndicator()
                                                          : Text(
                                                              'Choose from Gallery',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .blue),
                                                            ),
                                                    ],
                                                  ))
                                                : Image.memory(
                                                    webImage,
                                                    height: 150,
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.39,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ],
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
                    
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  bool? radcolor;
  List<String> mainctatgory = [];
  List<String> _listHorizontal = [
    "Explore our packages",
    "Get a car for rent ",
    "Let us guide you ",
    "Resturent",
    "Please select One MainCatagory"
  ];
  var _indexHorizontal = 4;
  Future<void> ShowBottomsheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: FlutterRadioGroup(
              titles: _listHorizontal,
              labelStyle:
                  GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 18),
              labelVisible: true,
              label: "Selected Book catagory",
              activeColor: Colors.blue,
              titleStyle: TextStyle(fontSize: 14),
              defaultSelected: _indexHorizontal,
              orientation: RGOrientation.VERTICAL,
              onChanged: (index) {
                Navigator.pop(context);
                setState(() {
                  _indexHorizontal = index!;
                  print(index);
                  print(_listHorizontal[index]);

                  switch (index) {
                    case 0:
                      {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     MySnackbar.ErrorSnackBar(
                        //         "${_listHorizontal[_indexHorizontal]} Images Is Null it's complusory to Upload"));
                        try {
                          if (mainimages != null) {
                            FirebaseFirestore firestore =
                                FirebaseFirestore.instance;
                            firestore
                                .collection(Allstring.products)
                                .doc(_listHorizontal[_indexHorizontal])
                                .set({
                              "mainimage": mainimages,
                              "maincontent": contentconroller.text,
                              "maincatagory": _listHorizontal[_indexHorizontal],
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                MySnackbar.successSnackBar(
                                    "${_listHorizontal[_indexHorizontal]} Images Successfull  Uploaded"));

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Packges(
                                          coverimages: mainimages,
                                          content: contentconroller.text,
                                          maincatagory:
                                              _listHorizontal[_indexHorizontal],
                                        )));
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              MySnackbar.ErrorSnackBar(
                                  "${_listHorizontal[_indexHorizontal]}${e}"));
                        }

                        break;
                      }
                    case 1:
                      {
                        try {
                          if (mainimages != null) {
                            FirebaseFirestore firestore =
                                FirebaseFirestore.instance;
                            firestore
                                .collection(Allstring.products)
                                .doc(_listHorizontal[_indexHorizontal])
                                .set({
                              "mainimage": mainimages,
                              "maincontent": contentconroller.text,
                              "maincatagory": _listHorizontal[_indexHorizontal],
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                MySnackbar.successSnackBar(
                                    "${_listHorizontal[_indexHorizontal]} Images Successfull  Uploaded"));

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Rentcars(
                                          coverimages: mainimages,
                                          content: contentconroller.text,
                                          maincatagory:
                                              _listHorizontal[_indexHorizontal],
                                        )));
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              MySnackbar.ErrorSnackBar(
                                  "${_listHorizontal[_indexHorizontal]}${e}"));
                        }

                        break;
                      }
                    case 2:
                      {
                        if (mainimages != null) {
                          FirebaseFirestore firestore =
                              FirebaseFirestore.instance;
                          firestore
                              .collection(Allstring.products)
                              .doc(_listHorizontal[_indexHorizontal])
                              .set({
                            "mainimage": mainimages,
                            "maincontent": contentconroller.text,
                            "maincatagory": _listHorizontal[_indexHorizontal],
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              MySnackbar.successSnackBar(
                                  "${_listHorizontal[_indexHorizontal]} Images Successfull  Uploaded"));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => topguides(
                                        coverimages: mainimages,
                                        content: contentconroller.text,
                                        maincatagory:
                                            _listHorizontal[_indexHorizontal],
                                      )));
                        }

                        break;
                      }
                    case 3:
                      {
                        if (mainimages != null) {
                          FirebaseFirestore firestore =
                              FirebaseFirestore.instance;
                          firestore.collection("topresturent").doc().set({
                            "mainimage": mainimages,
                            "maincontent": contentconroller.text,
                            "maincatagory": _listHorizontal[_indexHorizontal],
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              MySnackbar.successSnackBar(
                                  "${_listHorizontal[_indexHorizontal]} Images Successfull  Uploaded"));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Resturent_cities(
                                        coverimages: mainimages,
                                        content: contentconroller.text,
                                        maincatagory:
                                            _listHorizontal[_indexHorizontal],
                                      )));
                        }
                        break;
                      }
                    default:
                      ScaffoldMessenger.of(context).showSnackBar(
                          MySnackbar.ErrorSnackBar("Some thing went wrong"));
                  }
                });
              }),
        );
      },
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
            storage.ref().child('images/${path.basename(pickedImage.path)}');
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
