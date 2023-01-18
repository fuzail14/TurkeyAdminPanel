import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Dashboard_/dashbrd.dart';
import '../Dashboard_/guides/topguides.dart';
import '../Dashboard_/products/Add_products.dart';
import '../Dashboard_/products/Pacakges.dart';
import '../Dashboard_/products/Rentcars.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
        width: 200,
        backgroundColor: HexColor('#13326E'),
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/drawerheader.png"),
                      )),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // DrawerListTile(
              //     title: 'none',
              //     svgSrc: '',
              //     press: () {
              //       Container(
              //         height: 100,
              //         color: Colors.amber,
              //       );
              //     })

              MenuBox(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                },
                //padding: EdgeInsets.only(left: 0),
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ),
                menu: Text("Dashboard", style: textstyle),
              ),

              SizedBox(
                height: 30,
              ),
              MenuBox(
                //padding: EdgeInsets.only(left: 0,),
                icon: Icon(
                  Icons.add_task,
                  color: Colors.white,
                ),
                menu: Text("Photos", style: textstyle),
              ),

              SizedBox(
                height: 30,
              ),
              MenuBox(
                // padding: EdgeInsets.only(left: 0),
                icon: Icon(
                  Icons.announcement_rounded,
                  color: Colors.white,
                ),
                menu: Text("Services", style: textstyle),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.category,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Add Products',
                        style: textstyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MenuBox(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Addproducts()));
                    },
                    //padding: EdgeInsets.only(left: 0),
                    icon: Icon(
                      Icons.dashboard,
                      color: Colors.white,
                      size: 14,
                    ),

                    menu: Text(
                      "Add Main catagory",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.category_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Add Sub Category',
                        style: textstyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MenuBox(
                    icon: Icon(
                      Icons.explore,
                      color: Colors.white,
                      size: 14,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Packges(
                                  content: "images",
                                  coverimages: "images",
                                  maincatagory: "Explore our packages")));
                    },
                    // padding: const EdgeInsets.symmetric(
                    //     horizontal: 0, vertical: 15),

                    menu: Text(
                      "Explore our packages",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              MenuBox(
                icon: Icon(
                  Icons.car_rental,
                  color: Colors.white,
                  size: 14,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Rentcars(
                              content: "Rent Car",
                              coverimages: "Cover images",
                              maincatagory: "Get a car for rent ")));
                },
                // padding: const EdgeInsets.symmetric(
                //     horizontal: 0, vertical: 15),
                menu: Text(
                  "Get a car for rent ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              MenuBox(
                icon: Icon(
                  Icons.perm_device_info_rounded,
                  color: Colors.white,
                  size: 14,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => topguides(
                                maincatagory: 'Top Guides',
                                coverimages:
                                    'https://firebasestorage.googleapis.com/v0/b/turkey-app-40705.appspot.com/o/scaled_image_picker6773623610648662444.jpg?alt=media&token=83f9ae4f-b8a0-4cb3-b35a-9cb227e883eb',
                                content: 'Let us guide you ',
                              )));
                },
                // padding: const EdgeInsets.symmetric(
                //horizontal: 0, vertical: 15),
                menu: Text(
                  "Let us guide you",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MenuBox(
                //padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                icon: Icon(
                  Icons.supervised_user_circle_sharp,
                  color: Colors.white,
                ),
                menu: Text("users", style: textstyle),
              ),
              SizedBox(
                height: 30,
              ),
              MenuBox(
                // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                menu: Text("Setting", style: textstyle),
              ),

            ],
          ),
        ),
      );
      

  }
}