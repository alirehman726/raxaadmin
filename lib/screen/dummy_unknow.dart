import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:raxaadmin/Controller/controller_view_order.dart';
import 'package:raxaadmin/utils/images.dart';

class ScreenViewOrder extends StatefulWidget {
  final int id;

  const ScreenViewOrder({super.key, required this.id});

  @override
  State<ScreenViewOrder> createState() => _ScreenViewOrderState();
}

class _ScreenViewOrderState extends State<ScreenViewOrder> {
  final controllerViewProducts = Get.find<ControllerViewOrder>();

  @override
  void initState() {
    super.initState();

    print(widget.id);

    controllerViewProducts.controllerViewOrder(widget.id.toString());

    String status = controllerViewProducts.viewOrder[0].status;

    if (status == "pending") {
      selectedValue = "pending";
      options = ["pending", "dispatch"];
    } else if (status == "dispatch") {
      selectedValue = "dispatch";
      options = ["dispatch", "pending"];
    }
  }

  final List<Map<String, String>> data = [
    {"name": "Aditya Darji", "quntity": "10", "sales": "₹25000"},
    {"name": "Jay Darji", "quntity": "20", "sales": "₹70000"},
    {"name": "Kiran Patel", "quntity": "20", "sales": "₹2500"},
    {"name": "Bhautik Shah", "quntity": "25", "sales": "₹8000"},
  ];

  // String selectedValue = "January";
  // List<String> options = [
  //   "January",
  //   "February"
  // ];
  String selectedValue = "pending";
  List<String> options = ["pending", "dispatch"];

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
              "View Order",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),

      body: Obx(
        () {
          if (controllerViewProducts.loading.value) {
            return Center(child: CircularProgressIndicator(color: Colors.red));
          }
          return Column(
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
                              'Order Detail :-',
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
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      color: Color(0xff6f91c2),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Product",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16),
                          ),
                          Text(
                            "Quantity",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16),
                          ),
                          Text(
                            "Price",
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
                        children: List.generate(
                            controllerViewProducts.order.length, (index) {
                          print(controllerViewProducts.viewOrder);
                          print("controllerViewProducts.viewOrder");
                          return Container(
                            color: index % 2 == 0
                                ? Colors.lightBlue[100]
                                : Colors.lightBlue[300],
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controllerViewProducts
                                      .order[index].productName,
                                  // data[index]["name"]!,
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  controllerViewProducts.order[index].quantity
                                      .toString(),
                                  // data[index]["quntity"]!,
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  "₹  ${controllerViewProducts.order[index].price.toString()}",
                                  // data[index]["sales"]!,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 130,
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: Color(0xff3FCB1C),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text(
                              'APPROVE',
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
                            width: 130,
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: Color(0xffFF8800),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text(
                              'REJECT',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Status',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 120,
                                height: 40,
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(10),
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
                                              fontSize: 15,
                                              color: Colors.black),
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
                          //
                          //
                          //

                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Date',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 120,
                                height: 40,
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  DateFormat('MM/dd/yyyy').format(
                                      controllerViewProducts
                                          .viewOrder[0].orderDate),

                                  // '03/01/2025',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff3C3D86),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //
                          //
                          //

                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Payment ID',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 120,
                                height: 40,
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  controllerViewProducts.viewOrder[0].paymentId
                                      .toString(),
                                  // 'UTRN NO',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff3C3D86),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //
                          //
                          //

                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Action By',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 120,
                                height: 40,
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  controllerViewProducts.viewOrder[0].actionBy
                                      .toString(),
                                  // 'RAXADEAL001',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff3C3D86),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(''),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 130,
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xff67a5fc),
                                    borderRadius: BorderRadius.circular(7),
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
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
