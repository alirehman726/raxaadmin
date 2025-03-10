import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raxaadmin/Widgets/logoutDialog.dart';
import 'package:raxaadmin/screen/screen_ads.dart';
import 'package:raxaadmin/screen/screen_dealer.dart';
import 'package:raxaadmin/screen/screen_drawer.dart';
import 'package:raxaadmin/screen/screen_order_master.dart';
import 'package:raxaadmin/screen/screen_product.dart';
import 'package:raxaadmin/utils/color.dart';
import 'package:raxaadmin/utils/images.dart';

class ScreenReport extends StatefulWidget {
  @override
  _ScreenReportState createState() => _ScreenReportState();
}

class _ScreenReportState extends State<ScreenReport>
    with SingleTickerProviderStateMixin {
  String selectedValue = "January";
  List<String> options = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  
  String selectedValue1 = "2025";
  List<String> options1 = [
    "2025",
    "2024",
    "2023",
    "2022",
    "2021",
    "2020",
    "2019",
    "2018",
    "2017",
    "2016",
    "2015",
    "2014"
  ];

  List<Map<String, dynamic>> orderMasterData = [
    {
      "name": "Aditya Darji",
      "date": "DATE : 03/01/2025",
      "time": "TIME : 03:07 AM",
      "active": 1,
    },
    {
      "name": "Aditya Darji",
      "date": "DATE : 03/01/2025",
      "time": "TIME : 03:07 AM",
      "active": 0,
    },
    {
      "name": "Jay Darji",
      "date": "DATE : 03/01/2025",
      "time": "TIME : 03:07 AM",
      "active": 1,
    },
    {
      "name": "Pratik Darji",
      "date": "DATE : 03/01/2025",
      "time": "TIME : 03:07 AM",
      "active": 0,
    },
    {
      "name": "Bhautik Darji",
      "date": "DATE : 03/01/2025",
      "time": "TIME : 03:07 AM",
      "active": 0,
    },
    {
      "name": "Smit Darji",
      "date": "DATE : 03/01/2025",
      "time": "TIME : 03:07 AM",
      "active": 1,
    },
    {
      "name": "Smit Darji",
      "date": "DATE : 03/01/2025",
      "time": "TIME : 03:07 AM",
      "active": 1,
    },
    {
      "name": "Bhautik Darji",
      "date": "DATE : 03/01/2025",
      "time": "TIME : 03:07 AM",
      "active": 1,
    },
    {
      "name": "Jay Darji",
      "date": "DATE : 03/01/2025",
      "time": "TIME : 03:07 AM",
      "active": 0,
    },
    {
      "name": "Aditya Darji",
      "date": "DATE : 03/01/2025",
      "time": "TIME : 03:07 AM",
      "active": 0,
    },
  ];
  final List<Map<String, String>> data = [
    {"name": "Aditya Darji", "sales": "₹25000"},
    {"name": "Jay Darji", "sales": "₹70000"},
    {"name": "Kiran Patel", "sales": "₹2500"},
    {"name": "Bhautik Shah", "sales": "₹8000"},
    {"name": "Karan Panchal", "sales": "₹5000"},
    {"name": "Vishnu Prajapati", "sales": "₹790"},
    {"name": "Mayur Dave", "sales": "₹2400"},
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
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
          child: AppBar(
            backgroundColor: Colors.transparent, // Make AppBar transparent
            elevation: 0, // Remove shadow
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
            iconTheme: IconThemeData(color: Colors.white),

            centerTitle: true,
            title: Text(
              "Dealer Report",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
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
                          'You’re \n Doing Well',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3C3E89),
                          ),
                        ),
                        // SizedBox(
                        //   width: 100,
                        //   child: Divider(
                        //     color: Color(0xff01B8FA),
                        //     height: 2,
                        //     thickness: 3,
                        //   ),
                        // )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Color(0xff01B8FA),
                            border: Border.all(
                                color: Colors.blue, width: 2), // Blue border
                            borderRadius:
                                BorderRadius.circular(30), // Rounded corners
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedValue1,
                              items: options1.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue1 = newValue!;
                                });
                              },
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Colors.black), // Dropdown arrow
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Color(0xff01B8FA),
                            border: Border.all(
                                color: Colors.blue, width: 2), // Blue border
                            borderRadius:
                                BorderRadius.circular(30), // Rounded corners
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedValue,
                              items: options.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue!;
                                });
                              },
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Colors.black), // Dropdown arrow
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 10,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff01B8FA),
                        Color(0xff3C3D86),
                      ],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  color: Color(0xff6f91c2),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dealer Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                      Text(
                        "Sales",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                // Data Rows
                SingleChildScrollView(
                  child: Column(
                    children: List.generate(data.length, (index) {
                      return Container(
                        color: index % 2 == 0
                            ? Colors.lightBlue[100]
                            : Colors.lightBlue[300],
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data[index]["name"]!,
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              data[index]["sales"]!,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
