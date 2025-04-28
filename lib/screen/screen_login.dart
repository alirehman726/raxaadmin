import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:raxaadmin/Apis/auth_apis.dart';
import 'package:raxaadmin/Notification/local_notification_service.dart';
import 'package:raxaadmin/screen/demo.dart';
import 'package:raxaadmin/screen/screen_drawer.dart';
import 'package:raxaadmin/utils/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool processLoading = false;
  String deviceTokenToSendPushNotification = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDeviceId();

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          if (message.data['_id'] != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Demo(
                  id: message.data['_id'],
                ),
              ),
            );
          }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    // background notification
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    final token = await _fcm.getToken();
    deviceTokenToSendPushNotification = token.toString();
    print("Token Value $deviceTokenToSendPushNotification");
  }

  Future<void> getDeviceId() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      final id = androidInfo.id;
      print("Device ID: $id"); // This is the device's hardware ID
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      final id = iosInfo.identifierForVendor;
      print("Device ID: $id"); // This is unique per vendor on iOS
    }
  }
  // Future<void> getDeviceId() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  //   if (Platform.isAndroid) {
  //     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //     print("Android Device ID: ${androidInfo.id}"); // OR
  //     print(
  //         "Android Android ID: ${androidInfo.androidId}"); // ✅ This is usually unique
  //   } else if (Platform.isIOS) {
  //     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  //     print(
  //         "iOS Device ID: ${iosInfo.identifierForVendor}"); // ✅ Unique per app/vendor/device
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    getDeviceTokenToSendNotification();
    return Scaffold(
      backgroundColor: Color(0xFF01B8FA),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 80, left: 10, right: 10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 10),
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Expanded(
                //         child: Text(
                //           'Welcome to\nRaxa Spread Pvt Ltd.',
                //           style: TextStyle(
                //             fontSize: 24,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white,
                //           ),
                //         ),
                //       ),
                //       SizedBox(width: 10),
                //       Container(
                //         child: Image.asset(
                //           Images.LOGIN_MAIN_ICON,
                //           height: 150,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Expanded(
                      //   child: Text(
                      //     'Welcome to\nRaxa Spread Pvt Ltd.',
                      //     style: TextStyle(
                      //       fontSize: 24,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(width: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          // Images.LOGIN_MAIN_ICON,
                          Images.CENTER_ICON,
                          height: 150,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'रक्षा रक्षती सर्वत्रम',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Username / Email ID / Phone No",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: emailController,
                          validator: (email) {
                            if (email!.isEmpty) {
                              return "Please_insert_email_address".tr;
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(email)) {
                              return "Please_insert_a_valid_email_address".tr;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "example@gmail.com",
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: (pass) {
                            if (pass!.isEmpty) {
                              return "Please_enter_your_password".tr;
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "********",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 10),
                          ),
                          onPressed: () {
                            loginFun();
                            // Get.to(() => ScreenDrawer());
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            // Register action
                          },
                          child: Text(
                            "New user ? Register Now",
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginFun() async {
    // String? deviceId = await getDeviceId();
    // print('Device ID: $deviceId');

    if (_formKey.currentState!.validate()) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      processLoadingVal(true);

      dio.FormData body = dio.FormData.fromMap({
        // "token": appToken,
        "email": emailController.text,
        "password": passwordController.text,
        "device_id": deviceTokenToSendPushNotification.toString(),
      });
      var res = await AuthApis.APIlogin(body);
      if (res != null) {
        processLoadingVal(false);
        Map<String, dynamic> response = json.decode(res.toString());
        print(response);
        print(response['status']);
        print('Hello TVS');
        if (response['status'] == true) {
          sharedPreferences.setString("token", response['token']);
          sharedPreferences.setString("email", response['email']);
          sharedPreferences.setString("username", response['username']);
          Get.to(() => ScreenDrawer());
          Fluttertoast.showToast(
            msg: "Login Successfully".toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          processLoadingVal(false);
          Fluttertoast.showToast(
            msg: "Someting went wrong".toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } else {
        processLoadingVal(false);
        Fluttertoast.showToast(
          msg: "Someting went wrong".toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } else {
      // longToastMessage("Please Enter Valid Mobile Number!");
      Fluttertoast.showToast(
        msg: "Please Enter Valid Email & Password".toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  processLoadingVal(bool val) {
    setState(() {
      processLoading = val;
    });
  }
}
