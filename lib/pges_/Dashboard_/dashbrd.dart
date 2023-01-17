import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:turkeyadmin/pges_/Dashboard_/AllUsers/allusers_screen.dart';
import 'package:turkeyadmin/pges_/Dashboard_/products/Add_products.dart';
import 'package:turkeyadmin/pges_/Dashboard_/products/Pacakges.dart';
import 'package:turkeyadmin/pges_/Dashboard_/products/Rentcars.dart';
import 'package:turkeyadmin/pges_/Dashboard_/guides/topguides.dart';

PageController page = PageController();

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<SliderDrawerWidgetState> drawerKey = GlobalKey();

  List<Widget> _list = <Widget>[
    MenuBox(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => Dashboard()));
      },
      //padding: EdgeInsets.only(left: 0),
      icon: Icon(
        Icons.dashboard,
        color: Colors.white,
      ),
      menu: Text("Dashboard", style: textstyle),
    ),
    MenuBox(
      //padding: EdgeInsets.only(left: 0,),
      icon: Icon(
        Icons.add_task,
        color: Colors.white,
      ),
      menu: Text("Photos", style: textstyle),
    ),
    MenuBox(
      // padding: EdgeInsets.only(left: 0),
      icon: Icon(
        Icons.announcement_rounded,
        color: Colors.white,
      ),
      menu: Text("Services", style: textstyle),
    ),
    MenuBox(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => Addproducts()));
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
    MenuBox(
      icon: Icon(
        Icons.explore,
        color: Colors.white,
        size: 14,
      ),
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => Packges(
        //             content: "images",
        //             coverimages: "images",
        //             maincatagory: "Explore our packages")));
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
    MenuBox(
      icon: Icon(
        Icons.car_rental,
        color: Colors.white,
        size: 14,
      ),
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => Rentcars(
        //             content: "Rent Car",
        //             coverimages: "Cover images",
        //             maincatagory: "Get a car for rent ")));
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
    MenuBox(
      icon: Icon(
        Icons.perm_device_info_rounded,
        color: Colors.white,
        size: 14,
      ),
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => topguides(
        //               maincatagory: 'Top Guides',
        //               coverimages:
        //                   'https://firebasestorage.googleapis.com/v0/b/turkey-app-40705.appspot.com/o/scaled_image_picker6773623610648662444.jpg?alt=media&token=83f9ae4f-b8a0-4cb3-b35a-9cb227e883eb',
        //               content: 'Let us guide you ',
        //             )));
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
    MenuBox(
      //padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
      icon: Icon(
        Icons.supervised_user_circle_sharp,
        color: Colors.white,
      ),
      menu: Text("users", style: textstyle),
    ),
    MenuBox(
      // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
      icon: Icon(
        Icons.settings,
        color: Colors.white,
      ),
      menu: Text("Setting", style: textstyle),
    ),
  ];
  int? index;
  PageController page = PageController();
  @override
  Widget build(BuildContext context) {
    // return SliderDrawerWidget(
    //     key: drawerKey,
    //     option: SliderDrawerOption(
    //       backgroundColor: Colors.black,
    //       sliderEffectType: SliderEffectType.Rounded,
    //       upDownScaleAmount: 50,
    //       radiusAmount: 50,
    //       direction: SliderDrawerDirection.LTR,
    //     ),
    //     drawer: CustomDrawer(),
    //     body:
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: GestureDetector(
      //     onTap: () {
      //       drawerKey.currentState!.toggleDrawer();
      //     },
      //     child: Icon(
      //       Icons.menu,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),

      // body: PageView(
      //     onPageChanged: (value) {
      //       index = value;
      //     },
      //     controller: page,
      //     children: _list),

      // Drawer(
      //   width: 200,
      //   backgroundColor: HexColor('#13326E'),
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 30),
      //     child: ListView(
      //       children: [
      //         Align(
      //           alignment: Alignment.topRight,
      //           child: Container(
      //             height: 90,
      //             width: 90,
      //             decoration: BoxDecoration(
      //                 shape: BoxShape.circle,
      //                 image: DecorationImage(
      //                   image: AssetImage("assets/images/drawerheader.png"),
      //                 )),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 40,
      //         ),
      //         // DrawerListTile(
      //         //     title: 'none',
      //         //     svgSrc: '',
      //         //     press: () {
      //         //       Container(
      //         //         height: 100,
      //         //         color: Colors.amber,
      //         //       );
      //         //     })

      //         MenuBox(
      //           onTap: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => Dashboard()));
      //           },
      //           //padding: EdgeInsets.only(left: 0),
      //           icon: Icon(
      //             Icons.dashboard,
      //             color: Colors.white,
      //           ),
      //           menu: Text("Dashboard", style: textstyle),
      //         ),

      //         SizedBox(
      //           height: 30,
      //         ),
      //         MenuBox(
      //           //padding: EdgeInsets.only(left: 0,),
      //           icon: Icon(
      //             Icons.add_task,
      //             color: Colors.white,
      //           ),
      //           menu: Text("Photos", style: textstyle),
      //         ),

      //         SizedBox(
      //           height: 30,
      //         ),
      //         MenuBox(
      //           // padding: EdgeInsets.only(left: 0),
      //           icon: Icon(
      //             Icons.announcement_rounded,
      //             color: Colors.white,
      //           ),
      //           menu: Text("Services", style: textstyle),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Row(
      //               children: [
      //                 Icon(
      //                   Icons.category,
      //                   color: Colors.white,
      //                 ),
      //                 SizedBox(
      //                   width: 15,
      //                 ),
      //                 Text(
      //                   'Add Products',
      //                   style: textstyle,
      //                 ),
      //               ],
      //             ),
      //             SizedBox(
      //               height: 20,
      //             ),
      //             MenuBox(
      //               onTap: () {
      //                 Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => Addproducts()));
      //               },
      //               //padding: EdgeInsets.only(left: 0),
      //               icon: Icon(
      //                 Icons.dashboard,
      //                 color: Colors.white,
      //                 size: 14,
      //               ),

      //               menu: Text(
      //                 "Add Main catagory",
      //                 style: TextStyle(
      //                   fontSize: 14,
      //                   fontWeight: FontWeight.w600,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Row(
      //               children: [
      //                 Icon(
      //                   Icons.category_rounded,
      //                   color: Colors.white,
      //                 ),
      //                 SizedBox(
      //                   width: 15,
      //                 ),
      //                 Text(
      //                   'Add Sub Category',
      //                   style: textstyle,
      //                 ),
      //               ],
      //             ),
      //             SizedBox(
      //               height: 20,
      //             ),
      //             MenuBox(
      //               icon: Icon(
      //                 Icons.explore,
      //                 color: Colors.white,
      //                 size: 14,
      //               ),
      //               onTap: () {
      //                 Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => Packges(
      //                             content: "images",
      //                             coverimages: "images",
      //                             maincatagory: "Explore our packages")));
      //               },
      //               // padding: const EdgeInsets.symmetric(
      //               //     horizontal: 0, vertical: 15),

      //               menu: Text(
      //                 "Explore our packages",
      //                 style: TextStyle(
      //                   fontSize: 14,
      //                   fontWeight: FontWeight.w600,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //         SizedBox(
      //           height: 15,
      //         ),
      //         MenuBox(
      //           icon: Icon(
      //             Icons.car_rental,
      //             color: Colors.white,
      //             size: 14,
      //           ),
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => Rentcars(
      //                         content: "Rent Car",
      //                         coverimages: "Cover images",
      //                         maincatagory: "Get a car for rent ")));
      //           },
      //           // padding: const EdgeInsets.symmetric(
      //           //     horizontal: 0, vertical: 15),
      //           menu: Text(
      //             "Get a car for rent ",
      //             style: TextStyle(
      //               fontSize: 14,
      //               fontWeight: FontWeight.w600,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 15,
      //         ),
      //         MenuBox(
      //           icon: Icon(
      //             Icons.perm_device_info_rounded,
      //             color: Colors.white,
      //             size: 14,
      //           ),
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => topguides(
      //                           maincatagory: 'Top Guides',
      //                           coverimages:
      //                               'https://firebasestorage.googleapis.com/v0/b/turkey-app-40705.appspot.com/o/scaled_image_picker6773623610648662444.jpg?alt=media&token=83f9ae4f-b8a0-4cb3-b35a-9cb227e883eb',
      //                           content: 'Let us guide you ',
      //                         )));
      //           },
      //           // padding: const EdgeInsets.symmetric(
      //           //horizontal: 0, vertical: 15),
      //           menu: Text(
      //             "Let us guide you",
      //             style: TextStyle(
      //               fontSize: 14,
      //               fontWeight: FontWeight.w600,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 30,
      //         ),
      //         MenuBox(
      //           //padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
      //           icon: Icon(
      //             Icons.supervised_user_circle_sharp,
      //             color: Colors.white,
      //           ),
      //           menu: Text("users", style: textstyle),
      //         ),
      //         SizedBox(
      //           height: 30,
      //         ),
      //         MenuBox(
      //           // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
      //           icon: Icon(
      //             Icons.settings,
      //             color: Colors.white,
      //           ),
      //           menu: Text("Setting", style: textstyle),
      //         ),

      //       ],
      //     ),
      //   ),
      // ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: page,
            style: SideMenuStyle(
              backgroundColor: HexColor('#13326E'),

              // showTooltip: false,
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.blueGrey[700]
            ),
            title: Column(
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
              ],
            ),
            footer: Align(
              alignment: Alignment.bottomLeft,
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
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Dashboard',
                onTap: () {
                  page.jumpToPage(0);
                },
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ),
              ),
              SideMenuItem(
                priority: 1,
                title: 'Photos',
                onTap: () {
                  page.jumpToPage(1);
                },
                icon: const Icon(
                  Icons.add_task,
                  color: Colors.white,
                ),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Services',
                onTap: () {
                  page.jumpToPage(2);
                },
                icon: Icon(
                  Icons.announcement_rounded,
                  color: Colors.white,
                ),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Add Main catagory',
                onTap: () {
                  page.jumpToPage(3);
                },
                icon: const Icon(Icons.category),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Explore our packages',
                onTap: () {
                  page.jumpToPage(4);

                },
                icon: const Icon(
                  Icons.explore,
                  color: Colors.white,
                ),
              ),
              SideMenuItem(
                priority: 5,
                title: 'Get a car for rent ',
                onTap: () {
                  page.jumpToPage(5);
                },
                icon: const Icon(
                  Icons.car_rental,
                  color: Colors.white,
                ),
              ),
              SideMenuItem(
                  priority: 6,
                  title: 'Let us guide you',
                  onTap: () {
                    page.jumpToPage(6);
                  },
                  icon: Icon(
                    Icons.perm_device_info_rounded,
                    color: Colors.white,
                  )),
              SideMenuItem(
                priority: 7,
                title: 'Users',
                onTap: () {
                  page.jumpToPage(7);
                },
                icon: Icon(Icons.exit_to_app),
              ),
              const SideMenuItem(
                priority: 8,
                title: 'Exit',
                icon: Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                //0
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),

                // Container(
                //   color: Colors.white,
                //   child: const Center(
                //     child: Text(
                //       'Dashboard',
                //       style: TextStyle(fontSize: 35),
                //     ),
                //   ),
                // ),
                //1
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Users',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                //2
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Files',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                //3
                Addproducts(),
                //4
                Packges(
                    content: "images",
                    coverimages: "images",
                    maincatagory: "Explore our packages"),
                //5
                Rentcars(
                    content: "Rent Car",
                    coverimages: "Cover images",
                    maincatagory: "Get a car for rent "),
                //6
                topguides(
                  maincatagory: 'Top Guides',
                  coverimages:
                      'https://firebasestorage.googleapis.com/v0/b/turkey-app-40705.appspot.com/o/scaled_image_picker6773623610648662444.jpg?alt=media&token=83f9ae4f-b8a0-4cb3-b35a-9cb227e883eb',
                  content: 'Let us guide you ',
                ),

                //7
                AllUsersData(),
                //8
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Exit',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    //);
  }
}

final textstyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: HexColor('#FFFFFF'),
);

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Image.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}

// class CustomDrawer extends StatelessWidget {
//   Widget _thumbnailPart() {
//     return Row(
//       children: [
//         SizedBox(
//           width: 50,
//           height: 50,
//           child: CircleAvatar(),
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Text(
//                   "Sudarlife",
//                   style: TextStyle(color: Colors.white, fontSize: 24),
//                 ),
//                 Text(
//                   "Boys, be ambitious",
//                   style: TextStyle(
//                     color: Colors.white.withOpacity(0.5),
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget get _line => Container(
//       margin: const EdgeInsets.symmetric(vertical: 15),
//       height: 1,
//       color: Colors.white.withOpacity(0.2));

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(25),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               _thumbnailPart(),
//               SizedBox(height: 20),
//               _line,
//               MenuBox(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Dashboard()));
//                 },
//                 padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
//                 icon: Icon(
//                   Icons.dashboard,
//                   color: Colors.white,
//                 ),
//                 menu: Text(
//                   "Dashboard",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               MenuBox(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
//                 icon: Icon(
//                   Icons.add_task,
//                   color: Colors.white,
//                 ),
//                 menu: Text(
//                   "Photos",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               MenuBox(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
//                 icon: Icon(
//                   Icons.announcement_rounded,
//                   color: Colors.white,
//                 ),
//                 menu: Text(
//                   "Services",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               ExpansionTile(
//                 iconColor: Colors.white,
//                 collapsedTextColor: Colors.white,
//                 expandedAlignment: Alignment.topLeft,
//                 expandedCrossAxisAlignment: CrossAxisAlignment.start,
//                 title: Text(
//                   'Add Products',
//                   style: GoogleFonts.roboto(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white),
//                 ),
//                 children: [
//                   MenuBox(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Addproducts()));
//                     },
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
//                     icon: Icon(
//                       Icons.dashboard,
//                       color: Colors.white,
//                     ),
//                     menu: Text(
//                       "Add Main catagory",
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   ExpansionTile(
//                       iconColor: Colors.white,
//                       collapsedTextColor: Colors.white,
//                       expandedAlignment: Alignment.topLeft,
//                       expandedCrossAxisAlignment: CrossAxisAlignment.start,
//                       title: Text(
//                         'Add SubCatagory',
//                         style: GoogleFonts.roboto(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white),
//                       ),
//                       children: [
//                         MenuBox(
//                           icon: Icon(
//                             Icons.explore,
//                             color: Colors.white,
//                           ),
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Packges(
//                                         content: "images",
//                                         coverimages: "images",
//                                         maincatagory: "Explore our packages")));
//                           },
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 0, vertical: 15),
//                           menu: Text(
//                             "Explore our packages",
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         MenuBox(
//                           icon: Icon(
//                             Icons.car_rental,
//                             color: Colors.white,
//                           ),
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Rentcars(
//                                         content: "Rent Car",
//                                         coverimages: "Cover images",
//                                         maincatagory: "Get a car for rent ")));
//                           },
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 0, vertical: 15),
//                           menu: Text(
//                             "Get a car for rent ",
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         MenuBox(
//                           icon: Icon(
//                             Icons.perm_device_info_rounded,
//                             color: Colors.white,
//                           ),
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => topguides(
//                                           maincatagory: 'Top Guides',
//                                           coverimages:
//                                               'https://firebasestorage.googleapis.com/v0/b/turkey-app-40705.appspot.com/o/scaled_image_picker6773623610648662444.jpg?alt=media&token=83f9ae4f-b8a0-4cb3-b35a-9cb227e883eb',
//                                           content: 'Let us guide you ',
//                                         )));
//                           },
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 0, vertical: 15),
//                           menu: Text(
//                             "Let us guide you",
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ]),
//                 ],
//               ),
//               MenuBox(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
//                 icon: Icon(
//                   Icons.supervised_user_circle_sharp,
//                   color: Colors.white,
//                 ),
//                 menu: Text(
//                   "users",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               MenuBox(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
//                 icon: Icon(
//                   Icons.settings,
//                   color: Colors.white,
//                 ),
//                 menu: Text(
//                   "Setting",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MenuBox extends StatelessWidget {
  //final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final Widget menu;
  final Function()? onTap;
  const MenuBox({
    Key? key,
    required this.menu,
    // this.padding = const EdgeInsets.all(10),
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          this.onTap!();
        }
      },
      child: Container(
        // padding: padding,
        child: Row(
          children: [
            icon != null ? icon! : Container(),
            SizedBox(width: 15),
            menu,
          ],
        ),
      ),
    );
  }
}
