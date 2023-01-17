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
import '../../Helper/colorsconst.dart';
import '../../widgets/SnackBar_widget.dart';
import '../../widgets/logi_sinupb.dart';
import '../../widgets/producttextField.dart';

class returentproducts extends StatefulWidget {
  String cityname;
  String cityimage;
  String resturentname;
  String resturentimage;
  returentproducts(
      {required this.cityimage,
      required this.cityname,
      required this.resturentimage,
      required this.resturentname});
  @override
  State<returentproducts> createState() => _returentproductsState();
}

class _returentproductsState extends State<returentproducts> {
  var newlatlang;
  String formattedDate =
      DateFormat('MMMM, dd, yyy , kk:mm a').format(DateTime.now());
  TextEditingController Productcatagory = TextEditingController();

  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();

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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "City catagories",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  productfield(
                    width: null,
                    height: null,
                    controller: Productcatagory,
                    text: "Catagory",
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Set city catagory image"),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
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
                                citycatagoryimage == null
                                    ? "https://firebasestorage.googleapis.com/v0/b/turkey-app-40705.appspot.com/o/image%2011%20(4).png?alt=media&token=6c12aa3b-6025-4a7a-8ab6-5a8b6d141e00"
                                    : citycatagoryimage,
                              ))),
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
                  Text("Description"),
                  productfield(
                    width: null,
                    height: null,
                    controller: descriptioncontroller,
                    text: "Description",
                    textInputType: TextInputType.multiline,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Set location"),
                  productfield(
                    width: null,
                    height: null,
                    controller: locationcontroller,
                    text: "Set location",
                    textInputType: TextInputType.multiline,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  log_sigup(
                    text: "Set Guides",
                    onpressed: () async {
                      FirebaseFirestore firestore = FirebaseFirestore.instance;
                      try {
                        if (citycatagoryimage != null &&
                            Productcatagory.text.isNotEmpty &&
                            descriptioncontroller.text.isNotEmpty) {
                          await firestore.collection("resturent-products").add({
                            "date": formattedDate,
                            "productname": Productcatagory.text,
                            "location": locationcontroller.text,
                            "description": descriptioncontroller.text,
                            "prodcutimage": citycatagoryimage,
                            "cityname": widget.cityname,
                            "cityimage": widget.cityimage,
                            "resturentname": widget.resturentname,
                            "resturentimage": widget.resturentimage
                          });
                          clear();
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                            MySnackbar.successSnackBar("Store successully"));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Dashboard()));
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

  List<String> _listHorizontal = [
    "shopping",
    "historical places",
    "Admireable places",
    "Msidecine",
    "Please one subcatagory"
  ];

  var citycatagoryimage;
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
            citycatagoryimage = value;
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

  void clear() {
    Productcatagory.clear();
    descriptioncontroller.clear();
    locationcontroller.clear();
  }
}
