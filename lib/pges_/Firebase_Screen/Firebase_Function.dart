import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Dashboard_/dashbrd.dart';
import '../Helper/Stringconst.dart';
import '../widgets/SnackBar_widget.dart';
import 'UsrModel_data.dart';
FirebaseAuth _auth = FirebaseAuth.instance;
bool loading=false;
class AuthModels {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  ///GOOGLE SINGING METHOD

  ///STOREDATA TO FIREBASE
  Future<void> FirebaseSetData(BuildContext context, String name, String email,
      String id, String uid, String image) async {
    try {
      firestore.collection(Allstring.user).doc(id).set(
          UserModel(name: name, email: email, id: id, image: image).toJson());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar.successSnackBar(e.toString()));

    }
  }

  Future<void> EmailSingup(
      BuildContext context, String name, String email, String pasword) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: pasword);
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
        FirebaseSetData(context, name, email, _auth.currentUser!.uid,
            _auth.currentUser!.uid, _auth.currentUser!.photoURL.toString());
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar.ErrorSnackBar(e.toString()));

    }
  }

  Future<void> EmailSingnIn(
      BuildContext context, String email, String password) async {

    try {
      var user =
         await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (user!= null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
        ScaffoldMessenger.of(context).showSnackBar(MySnackbar.successSnackBar('You have logged in successfully'));
        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection("users")
            .doc(Allstring.user)
            .get();
        // userModel=UserModel.fromJson(userData.data() as Map<String, dynamic>);
        // print(userModel!.email);
      }

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar.ErrorSnackBar(e.toString()));
      print(e);
    }
  }
}
