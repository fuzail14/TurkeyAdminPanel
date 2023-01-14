import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turkeyadmin/pges_/Dashboard_/products/Add_products.dart';
import 'package:turkeyadmin/pges_/Dashboard_/products/Pacakges.dart';
import 'package:turkeyadmin/pges_/Dashboard_/products/Rentcars.dart';
import 'package:turkeyadmin/pges_/Dashboard_/guides/topguides.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<SliderDrawerWidgetState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SliderDrawerWidget(
        key: drawerKey,
        option: SliderDrawerOption(
          backgroundColor: Colors.black,
          sliderEffectType: SliderEffectType.Rounded,
          upDownScaleAmount: 50,
          radiusAmount: 50,
          direction: SliderDrawerDirection.LTR,
        ),
        drawer: CustomDrawer(),
        body: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () {
                drawerKey.currentState!.toggleDrawer();
              },
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ),
        ));
  }
}

class CustomDrawer extends StatelessWidget {
  Widget _thumbnailPart() {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: CircleAvatar(),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Sudarlife",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Text(
                  "Boys, be ambitious",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget get _line => Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 1,
      color: Colors.white.withOpacity(0.2));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _thumbnailPart(),
              SizedBox(height: 20),
              _line,
              MenuBox(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                },
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ),
                menu: Text(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              MenuBox(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                icon: Icon(
                  Icons.add_task,
                  color: Colors.white,
                ),
                menu: Text(
                  "Photos",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              MenuBox(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                icon: Icon(
                  Icons.announcement_rounded,
                  color: Colors.white,
                ),
                menu: Text(
                  "Services",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              ExpansionTile(
                iconColor: Colors.white,
                collapsedTextColor: Colors.white,
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                title: Text(
                  'Add Products',
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                children: [
                  MenuBox(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Addproducts()));
                    },
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    icon: Icon(
                      Icons.dashboard,
                      color: Colors.white,
                    ),
                    menu: Text(
                      "Add Main catagory",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ExpansionTile(
                      iconColor: Colors.white,
                      collapsedTextColor: Colors.white,
                      expandedAlignment: Alignment.topLeft,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      title: Text(
                        'Add SubCatagory',
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      children: [
                        MenuBox(
                          icon: Icon(
                            Icons.explore,
                            color: Colors.white,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 15),
                          menu: Text(
                            "Explore our packages",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        MenuBox(
                          icon: Icon(
                            Icons.car_rental,
                            color: Colors.white,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 15),
                          menu: Text(
                            "Get a car for rent ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        MenuBox(
                          icon: Icon(
                            Icons.perm_device_info_rounded,
                            color: Colors.white,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 15),
                          menu: Text(
                            "Let us guide you",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]),
                ],
              ),
              MenuBox(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                icon: Icon(
                  Icons.supervised_user_circle_sharp,
                  color: Colors.white,
                ),
                menu: Text(
                  "users",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              MenuBox(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                menu: Text(
                  "Setting",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuBox extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final Widget menu;
  final Function()? onTap;
  const MenuBox({
    Key? key,
    required this.menu,
    this.padding = const EdgeInsets.all(10),
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
        padding: padding,
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
