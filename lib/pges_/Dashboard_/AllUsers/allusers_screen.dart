import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AllUsersData extends StatefulWidget {
  @override
  State<AllUsersData> createState() => _AllUsersDataState();
}

class _AllUsersDataState extends State<AllUsersData> {
  final db = FirebaseFirestore.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('user');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 36),
          child: Text(
            'Users',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 33, left: 50),
          child: Row(
            children: [
              Text(
                'Name',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: HexColor('#030229')),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_downward,
                color: HexColor('#030229'),
              ),
              SizedBox(
                width: 221,
              ),
              Text(
                'Email',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: HexColor('#030229')),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_downward,
                color: HexColor('#030229'),
              ),
              // SizedBox(width: 259,),
              // Text(
              //   'Users',
              //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: HexColor('#030229')),
              // ),
              // SizedBox(width: 10,),
              // Icon(Icons.arrow_downward,
              // color: HexColor('#030229'),
              // ),
            ],
          ),
        ),
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('user').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 15, left: 30),
                    child: Container(
                      height: 60,
                      width: 500,
                      child: Card(
                        elevation: 5,
                        color: HexColor('#FFFFFF'),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Row(
                            children: [
                              // SizedBox(
                              //     height: 30,
                              //     width: 30,
                              //     child: CircleAvatar(
                              //       backgroundColor: Colors.white,
                              //       child: Image.network(
                              //         snapshot.data!.docs[index]['image']
                              //             .toString(),
                              //       ),
                              //     )),

                              SizedBox(
                                width: 10,
                              ),
                              Text(snapshot.data!.docs[index]['name'],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor('#030229'))),
                              SizedBox(
                                width: 170,
                              ),
                              Text(
                                snapshot.data!.docs[index]['email'],
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor('#030229')),
                              ),
                              SizedBox(
                                width: 170,
                              ),
                              InkWell(
                                onTap: () async {
                                  print(
                                      'id ${snapshot.data!.docs[index]['id'].toString()}');

                                  ref
                                      .doc(snapshot.data!.docs[index]['id']
                                          .toString())
                                      .delete();
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.delete,
                                  size: 24,
                                  color: HexColor('#13326E'),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () async {
                                  print(
                                      'id ${snapshot.data!.docs[index]['id'].toString()}');
                                  FirebaseAuth auth = FirebaseAuth.instance;

                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.block,
                                  size: 24,
                                  color: HexColor('#13326E'),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
