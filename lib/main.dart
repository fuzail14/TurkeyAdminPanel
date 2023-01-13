import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:turkeyadmin/pges_/Auth_Screen/login_page.dart';
import 'package:turkeyadmin/pges_/Dashboard_/dashbrd.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCnplWC2VM1I1qDoW8kCFvkPG0ElS5M-iQ",
      authDomain: "turkey-app-40705.firebaseapp.com",
      databaseURL: "https://turkey-app-40705-default-rtdb.firebaseio.com",
      projectId: "turkey-app-40705",
      storageBucket: "turkey-app-40705.appspot.com",
      messagingSenderId: "875203963399",
      appId: "1:875203963399:web:8df073d49f27eec50bd8a2",
      measurementId: "G-JE5SG72C33"
      
    
    )
  );
  

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Dashboard());
  }
}
