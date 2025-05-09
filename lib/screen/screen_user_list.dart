import 'dart:io';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raxaadmin/Controller/controller_userList.dart';
import 'package:raxaadmin/Widgets/logoutDialog.dart';
import 'package:raxaadmin/screen/screen_ads.dart';
import 'package:raxaadmin/screen/screen_city.dart';
import 'package:raxaadmin/screen/screen_dealer.dart';
import 'package:raxaadmin/screen/screen_drawer.dart';
import 'package:raxaadmin/screen/screen_order_master.dart';
import 'package:raxaadmin/screen/screen_product.dart';
import 'package:raxaadmin/utils/color.dart';
import 'package:raxaadmin/utils/images.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenUserList extends StatefulWidget {
  @override
  _ScreenUserListState createState() => _ScreenUserListState();
}

class _ScreenUserListState extends State<ScreenUserList>
    with SingleTickerProviderStateMixin {
  final controllerUserlist = Get.find<ControllerUserlist>();
  TextEditingController searchController = TextEditingController();
  RxString searchQuery = "".obs;

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery.value = query.toLowerCase();
    });
  }

  @override
  void initState() {
    super.initState();

    controllerUserlist.controllerUserlist();
    loadUserData();
  }

  List<Map<String, dynamic>> menuItems = [
    {
      "icon": Images.DRAWER_1,
      "title": "Home",
      "route": () => ScreenDrawer(),
    },
    {
      "icon": Images.DRAWER_2,
      "title": "Products",
      "route": () => ScreenProduct(),
    },
    {
      "icon": Images.DRAWER_3,
      "title": "Dealer Master",
      "route": () => ScreenDealer(),
    },
    {
      "icon": Images.DRAWER_4,
      "title": "Order Master",
      "route": () => ScreenOrderMaster(),
    },
    {
      "icon": Images.DRAWER_5,
      "title": "Approve Ads",
      "route": () => ScreenAds(),
    },
    // {
    //   "icon": Images.DRAWER_6,
    //   "title": "City Master",
    //   "route": () => ScreenReport(),
    // },
    {
      "icon": Images.DRAWER_6,
      "title": "City Master",
      "route": () => ScreenCity(),
    },
    {
      // "icon": Images.DRAWER_6,
      "icon": Images.DRAWER_3,
      "title": "User List",
      "route": () => ScreenUserList(),
    },
  ];

  int selectedIndex = 0;
  bool isSwitched = false;

  String? username;
  String? email;
  void _launchURL() async {
    const url =
        'https://www.design-blitz.com/'; // 👈 Replace with your actual link
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? 'ADMIN';
      email = prefs.getString('email') ?? 'example@gmail.com';
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          // SystemNavigator.pop();
          Get.to(() => ScreenDrawer());
        } else if (Platform.isIOS) {
          exit(0);
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xffccf1fe),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff01B8FA),
          title: Text(
            "User List",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                Images.PROFILE_ICON,
                height: 35,
                width: 35,
              ),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20, left: 10),
                height: 120,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          Images.PROFILE_ICON,
                          height: 60,
                          width: 60,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                username ?? '',
                                // 'ADMIN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Text(
                              email ?? '',
                              // 'example@gmail.com',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
                height: 2,
              ),
              const SizedBox(height: 20),
              ...List.generate(menuItems.length, (index) {
                bool isSelected = selectedIndex == index;
                return InkWell(
                  onTap: () {
                    // setState(() {
                    //   selectedIndex = index;
                    //   print(selectedIndex);
                    //   if (selectedIndex == 7) {
                    //     logoutDialog_logout(context);
                    //   }
                    // });
                  },
                  child: Container(
                    child: Row(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: 5,
                          height: 35,
                          decoration: BoxDecoration(
                            // color: isSelected ? Colors.red : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            onTap: () {
                              print(menuItems[index]["route"]());
                              print('Rehmanali');
                              Navigator.pop(context);
                              Get.to(menuItems[index]["route"]());
                            },
                            leading: Image.asset(
                              menuItems[index]["icon"],
                              height: 23,
                              width: 23,
                              color: primaryColor,
                              // color: isSelected ? Colors.red : Colors.black54,
                            ),
                            title: Text(
                              menuItems[index]["title"],
                              style: TextStyle(
                                color: Color(0xff3C3D86),
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                // color: isSelected ? Colors.red : Colors.black54,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: gradient2,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              Spacer(),
              InkWell(
                onTap: () {
                  logoutDialog_logout(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        Images.DRAWER_7,
                        height: 23,
                        width: 23,
                        color: primaryColor,
                        // color: isSelected ? Colors.red : Colors.black54,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Logout",
                        style: TextStyle(
                          color: Color(0xff3C3D86),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          // color: isSelected ? Colors.red : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            children: [
                              const TextSpan(
                                text: 'All Right Reserved By ',
                                style: TextStyle(
                                  color: Color(0xFF3C3C90), // Dark purple-ish
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: 'Design-blitz',
                                style: const TextStyle(
                                  color: Colors
                                      .lightBlueAccent, // Light blue clickable
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = _launchURL,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: 'App Version : 1.0',
                            style: TextStyle(
                              color: Color(0xFF3C3C90), // Dark purple-ish
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff01B8FA),
                    Color(0xff2596be),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xff2596BE)),
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        onChanged: updateSearchQuery,
                        decoration: InputDecoration(
                          hintText: "Search here",
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Icon(Icons.search, color: Colors.white),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              color: Color(0xff01B8FA),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Show All User List',
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3C3E89),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Divider(
                              color: Color(0xff01B8FA),
                              height: 2,
                              thickness: 3,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Obx(() {
              if (controllerUserlist.loading.value) {
                return Center(
                    child: CircularProgressIndicator(color: Colors.red));
              }
              var filteredProducts = controllerUserlist.userList
                  .where((order) => order.name
                      .trim()
                      .toLowerCase()
                      .contains(searchQuery.value.trim()))
                  .toList();

              if (filteredProducts.isEmpty) {
                // ✅ Ensure search results are shown
                return Center(
                  child: Text(
                    "No User data available",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                );
              }
              // if (controllerAllAds.allAds.isEmpty) {
              //   return Center(
              //     child: Text(
              //       "No Ads data available",
              //       style: TextStyle(color: Colors.red, fontSize: 16),
              //     ),
              //   );
              // }
              return Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffe6f8ff),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  child: ListView.builder(
                    // itemCount: controllerAllAds.allAds.length,
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      var userList = filteredProducts[index];
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundColor: getColorFromHex(
                                            controllerUserlist
                                                .userList[index].colorCode)
                                        .withOpacity(0.5),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: ClipOval(
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: getColorFromHex(
                                              controllerUserlist
                                                  .userList[index].colorCode),
                                          // backgroundColor: (() {
                                          //   Color randomColor = getRandomColor();
                                          //   return randomColor;
                                          // })(),
                                          child: Text(
                                            // 'AD',
                                            getInitials(controllerUserlist
                                                .userList[index].name),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userList.name,
                                        // orderMasterData[index]['name'],
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff3C3E89),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        "Phone No : ${controllerUserlist.userList[index].phoneNumber.toString()}",
                                        // "DATE : ${DateFormat('MM/dd/yyyy').format(controllerAllAds.allAds[index].date)}",

                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w200,
                                          color: Color(0xff3C3E89),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Expanded(
                              //   flex: 1,
                              //   child: Container(
                              //     child: Column(
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       crossAxisAlignment:
                              //           CrossAxisAlignment.center,
                              //       children: [
                              //         InkWell(
                              //           onTap: () {
                              //             Get.to(
                              //               () => ScreenViewAds(
                              //                 id: controllerUserlist
                              //                     .userList[index].id,
                              //                 name: controllerUserlist
                              //                     .userList[index].name,
                              //                 date: controllerUserlist
                              //                     .userList[index].date
                              //                     .toString(),
                              //               ),
                              //             );
                              //           },
                              //           child: Text(
                              //             "View",
                              //             style: TextStyle(
                              //               fontSize: 14,
                              //               fontWeight: FontWeight.w100,
                              //               color: Color(0xff0158FA),
                              //             ),
                              //           ),
                              //         ),
                              //         const SizedBox(height: 10),
                              //         Text(
                              //           controllerAllAds.allAds[index].status,
                              //           // "Approve/Reject/Pending",
                              //           textAlign: TextAlign.center,
                              //           style: TextStyle(
                              //             fontSize: 14,
                              //             fontWeight: FontWeight.w800,
                              //             color: Color(0xff3C3D86),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Divider(
                            color: Colors.black,
                            height: 2,
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Color getColorFromHex(String hexColor) {
    hexColor = hexColor
        .replaceAll("#", "")
        .toUpperCase(); // "#" ko remove kare aur uppercase kare

    final validHex =
        RegExp(r'^[0-9A-Fa-f]{6}$'); // Sirf valid hex colors allow kare
    if (!validHex.hasMatch(hexColor)) {
      print("Invalid color code: $hexColor");
      return Colors.primaries[
          hexColor.hashCode % Colors.primaries.length]; // Random unique color
    }

    return Color(int.parse("0xff$hexColor"));
  }

  String getInitials(String name) {
    List<String> words = name.trim().split(" ");
    if (words.length == 1) {
      return words[0][0]
          .toUpperCase(); // Sirf ek word ho to ek letter return kare
    } else {
      return (words[0][0] + words[1][0])
          .toUpperCase(); // Pehla aur dusra letter return kare
    }
  }
}

Color getRandomColor() {
  final Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}
