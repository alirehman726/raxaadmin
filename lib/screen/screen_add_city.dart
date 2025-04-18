import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:raxaadmin/Apis/auth_apis.dart';
import 'package:raxaadmin/Controller/controller_city.dart';
import 'package:raxaadmin/screen/screen_city.dart';
import 'package:raxaadmin/utils/images.dart';

class ScreenAddCity extends StatefulWidget {
  const ScreenAddCity({super.key});

  @override
  State<ScreenAddCity> createState() => _ScreenAddCityState();
}

class _ScreenAddCityState extends State<ScreenAddCity> {
  String selectedValue = "Yes";
  List<String> options = ["Yes", "No"];
  File? _image;
  final _formKey = GlobalKey<FormState>();
  String productName = '';
  String description = '';
  String netQuantity = '';
  String weight = '';
  String packingType = '';
  String flavour = '';
  String price = '';

  TextEditingController nameController = TextEditingController();
  // String addedDate = 'Select Date';

  // Future<void> _pickImage() async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   }
  // }
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // void _showDatePicker() async {
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );
  //   if (pickedDate != null && pickedDate != DateTime.now()) {
  //     setState(() {
  //       addedDate = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
  //     });
  //   }
  // }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Perform submission logic here
      doCallAPILogin();
      // Get.snackbar("Success", "Product added successfully!");
    }
  }

  Future<void> doCallAPILogin() async {
    doStartLoader(true);

    try {
      dio.FormData body = dio.FormData.fromMap({
        "name": nameController.text,
      });

      var res = await AuthApis.addCityAPI(body);

      if (res != null) {
        Map<String, dynamic> response = json.decode(res.toString());
        if (response['status'] == true) {
          Fluttertoast.showToast(msg: response['message'].toString());
          Get.offAll(() => ScreenCity());

          final controllercity = Get.find<ControllerCity>();
          await controllercity.controllercity();
          controllercity.update();
        } else {
          Fluttertoast.showToast(msg: response['message'].toString());
        }
      } else {
        Fluttertoast.showToast(msg: "Something went wrong. Try again.");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error: ${e.toString()}");
    } finally {
      doStartLoader(false);
    }
  }

  doStartLoader(bool val) {
    setState(() {
      isLoading = val;
    });
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            centerTitle: true,
            title: Text(
              "Add City",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                color: Color(0xff01B8FA),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add City',
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
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "City",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff737c80),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please insert valid City";
                        }
                        if (value.length < 3) {
                          return "City should be min 3 characters long";
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffe6f8ff),
                        labelText: "Enter your City",
                        // labelStyle: TextStyle(
                        //   fontWeight: FontWeight.bold,
                        //   color: Colors.black87,
                        // ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 80,
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 15, bottom: 15),
                            decoration: BoxDecoration(
                              color: Color(0xffFF8800),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Get.back();
                            doCallAPILogin();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 80,
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 15, bottom: 15),
                            decoration: BoxDecoration(
                              color: Color(0xff0158FA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
