import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raxaadmin/Widgets/logoutDialog.dart';
import 'package:raxaadmin/screen/screen_add_dealer.dart';
import 'package:raxaadmin/screen/screen_ads.dart';
import 'package:raxaadmin/screen/screen_drawer.dart';
import 'package:raxaadmin/screen/screen_edit_dealer.dart';
import 'package:raxaadmin/screen/screen_order_master.dart';
import 'package:raxaadmin/screen/screen_product.dart';
import 'package:raxaadmin/utils/color.dart';
import 'package:raxaadmin/utils/images.dart';

import 'screen_report.dart';

class ScreenDealer extends StatefulWidget {
  @override
  _ScreenDealerState createState() => _ScreenDealerState();
}

class _ScreenDealerState extends State<ScreenDealer>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> dealerData = [
    {
      "name": "Aditya Darji",
      "desc": "RAXADEAL001",
      "active": 1,
    },
    {
      "name": "Aditya Darji",
      "desc": "RAXADEAL002",
      "active": 0,
    },
    {
      "name": "Jay Darji",
      "desc": "RAXADEAL003",
      "active": 1,
    },
    {
      "name": "Pratik Darji",
      "desc": "RAXADEAL004",
      "active": 0,
    },
    {
      "name": "Bhautik Darji",
      "desc": "RAXADEAL005",
      "active": 0,
    },
    {
      "name": "Smit Darji",
      "desc": "RAXADEAL006",
      "active": 1,
    },
    {
      "name": "Smit Darji",
      "desc": "RAXADEAL007",
      "active": 1,
    },
    {
      "name": "Bhautik Darji",
      "desc": "RAXADEAL008",
      "active": 1,
    },
    {
      "name": "Jay Darji",
      "desc": "RAXADEAL009",
      "active": 0,
    },
    {
      "name": "Aditya Darji",
      "desc": "RAXADEAL010",
      "active": 0,
    },
  ];

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
    {
      "icon": Images.DRAWER_6,
      "title": "Dealer Report",
      "route": () => ScreenReport(),
    },
  ];

  int selectedIndex = 0;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffccf1fe),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff01B8FA),
        title: Text(
          "Dealer Page",
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
                              'ADMIN',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Text(
                            'example@gmail.com',
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
                            Get.to(menuItems[index]["route"]());
                          },
                          leading: Image.asset(
                            menuItems[index]["icon"],
                            height: 23,
                            width: 23,
                            color: primaryColor,
                          ),
                          title: Text(
                            menuItems[index]["title"],
                            style: TextStyle(
                              color: Color(0xff3C3D86),
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
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
            )
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
                      decoration: InputDecoration(
                        hintText: "Search Product",
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
                          'Show All Dealer’s',
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
                    InkWell(
                      onTap: () {
                        Get.to(() => ScreenAddDealer());
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Color(0xff3C3E89),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Color(0xff3C3E89),
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'ADD NEW DILLER',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffe6f8ff),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: ListView.builder(
                itemCount: dealerData.length,
                itemBuilder: (context, index) {
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
                                backgroundColor: (() {
                                  Color randomColor = getRandomColor();
                                  return randomColor.withOpacity(0.5);
                                })(),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ClipOval(
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: (() {
                                        Color randomColor = getRandomColor();
                                        return randomColor;
                                      })(),
                                      child: Text(
                                        'AD',
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
                              height: 50,
                              width: 50,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dealerData[index]['name'],
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff3C3E89),
                                    ),
                                  ),
                                  Text(
                                    dealerData[index]['desc'],
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
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => ScreenEditDealer());
                                    },
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w100,
                                        color: Color(0xff3C3E89),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    dealerData[index]['active'] == 1
                                        ? "Active"
                                        : "Deactive",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w100,
                                      color: dealerData[index]['active'] == 1
                                          ? Color(0xff3C3D86)
                                          : Color(0xff3C3D86),
                                    ),
                                  ),
                                  Transform.scale(
                                    scale: 0.8,
                                    child: Container(
                                      child: Switch(
                                        value: dealerData[index]['active'] == 1,
                                        onChanged: (value) {
                                          setState(() {
                                            dealerData[index]['active'] =
                                                value ? 1 : 0;
                                          });
                                        },
                                        activeColor: Colors.green,
                                        activeTrackColor: Colors.white,
                                        inactiveThumbColor: Color(0xffADBABF),
                                        inactiveTrackColor: Colors.white,
                                        trackOutlineColor:
                                            MaterialStateProperty.all(
                                                Colors.transparent),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
          )
        ],
      ),
    );
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
