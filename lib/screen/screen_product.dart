import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:raxaadmin/Apis/auth_apis.dart';
import 'package:raxaadmin/Controller/controller_allProducts.dart';
import 'package:raxaadmin/Widgets/logoutDialog.dart';
import 'package:raxaadmin/Widgets/myToasts.dart';
import 'package:raxaadmin/screen/screen_add_products.dart';
import 'package:raxaadmin/screen/screen_ads.dart';
import 'package:raxaadmin/screen/screen_dealer.dart';
import 'package:raxaadmin/screen/screen_drawer.dart';
import 'package:raxaadmin/screen/screen_edit_product.dart';
import 'package:raxaadmin/screen/screen_order_master.dart';
import 'package:raxaadmin/screen/screen_report.dart';
import 'package:raxaadmin/utils/color.dart';
import 'package:raxaadmin/utils/images.dart';

class ScreenProduct extends StatefulWidget {
  @override
  _ScreenProductState createState() => _ScreenProductState();
}

class _ScreenProductState extends State<ScreenProduct>
    with SingleTickerProviderStateMixin {
  final controllerAllProducts = Get.find<ControllerAllproducts>();
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
    controllerAllProducts.controllerAllProducts();
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
    {
      "icon": Images.DRAWER_6,
      "title": "Dealer Report",
      "route": () => ScreenReport(),
    },
  ];

  int selectedIndex = 0;

  void deleteItem(int id) async {
    var res = await AuthApis.deleteOrderApi(id);

    if (res != null) {
      Map<String, dynamic> response = json.decode(res.toString());

      if (response['status'] == true) {
        // ✅ API Call करके डेटा अपडेट करो
        await controllerAllProducts.controllerAllProducts();

        // ✅ UI अपडेट करो
        setState(() {
          isLoading = false;
        });

        print("✅ Data refreshed successfully!");
        // if (controllerAllProducts.controllerAllProducts) {
        //   Get.back(); // ✅ Model Close
        // }
      } else {
        setState(() {
          isLoading = false;
        });
        SnackbarCustom.error("Error", response['message']);
      }
    } else {
      throw Exception("No Response from API");
    }
  }

  Future<void> doCallAPILogin(int id, String status) async {
    doStartLoader1(true);

    dio.FormData body = dio.FormData.fromMap({
      "user_id": id.toString(),
      "status": status.toString(),
    });
    var res = await AuthApis.productStatusAPI(body);

    if (res != null) {
      Map<String, dynamic> response = json.decode(res.toString());
      print(response);
      print(response['status']);
      if (response['status'] == true) {
        Fluttertoast.showToast(
          msg: response['message'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        doStartLoader1(false);
        // SnackbarCustom.error("Error", response['message']);
        Fluttertoast.showToast(
          msg: response['message'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } else {
      doStartLoader1(false);
      Fluttertoast.showToast(
        msg: "Something Error ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      // SnackbarCustom.error("Error",
      //     "Unable_to_login_at_the_moment_Please_try_again_after_sometime");
    }
  }

  bool isLoading = false;
  bool isLoading1 = false;

  doStartLoader1(bool val) {
    setState(() {
      isLoading1 = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffccf1fe),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff01B8FA),
        title: Text(
          "PRODUCT PAGE",
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
                  borderRadius: BorderRadius.circular(25), // Rounded corners
                  color: Color(0xff2596BE)
                  // gradient: LinearGradient(
                  //   colors: [
                  //     Colors.blue,
                  //     Colors.lightBlueAccent
                  //   ], // Gradient background
                  //   begin: Alignment.centerLeft,
                  //   end: Alignment.centerRight,
                  // ),
                  ),
              padding: EdgeInsets.only(left: 20, right: 20),
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: updateSearchQuery,
                      decoration: InputDecoration(
                        hintText: "Search Product",
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none, // No underline
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Icon(Icons.search, color: Colors.white), // Search Icon
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
                          'All Product’s',
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
                        Get.to(() => ScreenAddProducts());
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
                              'ADD NEW PRODUCT',
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
          Obx(() {
            if (controllerAllProducts.loading.value) {
              return Center(
                  child: CircularProgressIndicator(color: Colors.red));
            }

            var filteredProducts = controllerAllProducts.allProducts
                .where((product) => product.productName
                    .trim()
                    .toLowerCase()
                    .contains(searchQuery.value.trim()))
                .toList();

            if (filteredProducts.isEmpty) {
              // ✅ Ensure search results are shown
              return Center(
                child: Text(
                  "No product found",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              );
            }

            return Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length, // ✅ Correct list used
                itemBuilder: (context, index) {
                  var product = filteredProducts[index]; // ✅ Correct indexing
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15, right: 15, top: 10, bottom: 10),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.network(
                                  product.image
                                      .toString(), // ✅ Correct product reference
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${product.productName} - ${product.discription}",
                                      style: TextStyle(
                                          color: Color(0xff3C3D86),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w200),
                                    ),
                                    Text(
                                      "IN Stock : ${product.stock}",
                                      style: TextStyle(
                                          color: Color(0xff01B8FA),
                                          fontStyle: FontStyle.italic,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => ScreenEditProduct(
                                            product: product));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black, width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Edit",
                                              style: TextStyle(
                                                  color: Color(0xff3C3D86),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Icon(Icons.edit,
                                                color: Color(0xff01B8FA),
                                                size: 15)
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        deleteItem(product.id);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black, width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: Color(0xff3C3D86),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Icon(Icons.delete,
                                                color: Colors.red, size: 15)
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    // Text(
                                    //   controllerAllProducts
                                    //                   .allProducts[index].status ==
                                    //           "1"
                                    //       ? "Active"
                                    //       : "Deactive",
                                    //   style: TextStyle(
                                    //     fontSize: 14,
                                    //     fontWeight: FontWeight.w100,
                                    //     color: controllerAllProducts
                                    //                   .allProducts[index].status ==
                                    //             "1"
                                    //         ? Color(0xff3C3D86)
                                    //         : Color(0xff3C3D86),
                                    //   ),
                                    // ),
                                    // Transform.scale(
                                    //   scale: 0.8,
                                    //   child: Container(
                                    //     child: Switch(
                                    //       value: controllerAllProducts
                                    //               .allProducts[index].status ==
                                    //           "1",
                                    //       onChanged: (value) {
                                    //         setState(() {
                                    //           controllerAllProducts
                                    //               .allProducts[index]
                                    //               .status = value ? "1" : "0";

                                    //           print("AAAAAAAA");
                                    //           doCallAPILogin(
                                    //               controllerAllProducts
                                    //                   .allProducts[index].id,
                                    //               controllerAllProducts
                                    //                   .allProducts[index]
                                    //                   .status);
                                    //         });
                                    //       },
                                    //       activeColor: Colors.green,
                                    //       activeTrackColor: Colors.white,
                                    //       inactiveThumbColor: Color(0xffADBABF),
                                    //       inactiveTrackColor: Colors.white,
                                    //       trackOutlineColor:
                                    //           MaterialStateProperty.all(
                                    //               Colors.transparent),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          })
        ],
      ),
    );
  }
}
