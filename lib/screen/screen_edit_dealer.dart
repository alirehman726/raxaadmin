import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raxaadmin/screen/screen_dealer.dart';
import 'package:raxaadmin/utils/images.dart';

class ScreenEditDealer extends StatefulWidget {
  const ScreenEditDealer({super.key});

  @override
  State<ScreenEditDealer> createState() => _ScreenEditDealerState();
}

class _ScreenEditDealerState extends State<ScreenEditDealer> {
  String selectedValue = "Yes"; // Default selected value
  List<String> options = ["Yes", "No"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Prevents keyboard overflow
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
              "Edit Dealer",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            CrossAxisAlignment.start, // ✅ Align everything to start
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffe6f8ff),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: 80,
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
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Aditya Darji",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff3C3E89),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Icon(
                      Icons.edit,
                      color: Color(0xff0158FA),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  "Phone no.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff737c80),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "+91 1234567890",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff404042),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Phone no",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff737c80),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Rasana Mota, Deesa, B.K, Gujrat-385535",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff404042),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Email ID",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff737c80),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "aditya@design-blitz.com",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff404042),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Username",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff737c80),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "RAXADEAL001",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff404042),
                  ),
                ),
                const SizedBox(height: 30),
                const SizedBox(height: 17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 70,
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: Color(0xff3C3D86),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'Edit',
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
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 70,
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: Color(0xff01B8FA),
                          borderRadius: BorderRadius.circular(5),
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
    );
  }
}
