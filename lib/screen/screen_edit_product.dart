// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:raxaadmin/utils/images.dart';

// class ScreenEditProduct extends StatefulWidget {
//   const ScreenEditProduct({super.key});

//   @override
//   State<ScreenEditProduct> createState() => _ScreenEditProductState();
// }

// class _ScreenEditProductState extends State<ScreenEditProduct> {
//   String selectedValue = "Yes"; // Default selected value
//   List<String> options = ["Yes", "No"];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Color(0xffccf1fe),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight),
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xff01B8FA),
//                 Color(0xff2596be),
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           child: AppBar(
//             backgroundColor: Colors.transparent, // Make AppBar transparent
//             elevation: 0, // Remove shadow
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 10),
//                 child: Image.asset(
//                   Images.PROFILE_ICON,
//                   height: 35,
//                   width: 35,
//                 ),
//               ),
//             ],
//             leading: IconButton(
//               icon: Icon(
//                 Icons.arrow_back_ios_new_rounded,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 Get.back();
//               },
//             ),
//             centerTitle: true,
//             title: Text(
//               "Edit PRODUCT",
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: EdgeInsets.all(5),
//             color: Color(0xff01B8FA),
//           ),
//           const SizedBox(height: 5),
//           Padding(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Edit Product',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontStyle: FontStyle.italic,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xff3C3E89),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 100,
//                   child: Divider(
//                     color: Color(0xff01B8FA),
//                     height: 2,
//                     thickness: 3,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
//             child: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 20, right: 20, top: 20),
//                     child: Text(
//                       'Edit Product',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontStyle: FontStyle.italic,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xff3C3E89),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         height: 50,
//                         width: 30,
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(40),
//                             bottomRight: Radius.circular(40),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Divider(
//                           color: Color(0xffcccccc),
//                           thickness: 2, // Use thickness to make it visible
//                         ),
//                       ),
//                       Container(
//                         height: 50,
//                         width: 30,
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(40),
//                             bottomLeft: Radius.circular(40),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         // Container(
//                         //   height: 150,
//                         //   width: 150,
//                         //   color: Colors.red,
//                         // ),
//                         Container(
//                           height: 100,
//                           width: 100,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8.0),
//                             image: DecorationImage(
//                               image: NetworkImage(
//                                   "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80"),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.all(5),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Edit Product',
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xff3C3E89),
//                                 ),
//                               ),
//                               const SizedBox(height: 10),
//                               Text(
//                                 'Hight : 500px',
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w200,
//                                   color: Color(0xff3C3E89),
//                                 ),
//                               ),
//                               const SizedBox(height: 10),
//                               Text(
//                                 'Weight : 500px',
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w200,
//                                   color: Color(0xff3C3E89),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "Product Name",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue[900],
//                             ),
//                           ),
//                         ),
//                         TextField(
//                           decoration: InputDecoration(
//                             hintText: "JPSR Prabhu Shriram Agarbatti",
//                             hintStyle: TextStyle(fontWeight: FontWeight.bold),
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.blueAccent),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "Discrption",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue[900],
//                             ),
//                           ),
//                         ),
//                         TextField(
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             hintText:
//                                 "JPSR Prabhu Shriram Agarbatti Perfume incense sticks....",
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.blueAccent),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(20),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   'In Stock : ',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xff3C3E89),
//                                   ),
//                                 ),
//                                 Container(
//                                   alignment: Alignment.center,
//                                   width: 60,
//                                   height: 25,
//                                   padding: EdgeInsets.symmetric(horizontal: 5),
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: Colors.blue,
//                                         width: 2), // Blue border
//                                     borderRadius: BorderRadius.circular(
//                                         5), // Rounded corners
//                                   ),
//                                   child: DropdownButtonHideUnderline(
//                                     child: DropdownButton<String>(
//                                       value: selectedValue,
//                                       items: options.map((String value) {
//                                         return DropdownMenuItem<String>(
//                                           value: value,
//                                           child: Text(
//                                             value,
//                                             style: TextStyle(
//                                                 fontSize: 12,
//                                                 color: Colors.black),
//                                           ),
//                                         );
//                                       }).toList(),
//                                       onChanged: (String? newValue) {
//                                         setState(() {
//                                           selectedValue = newValue!;
//                                         });
//                                       },
//                                       icon: Icon(Icons.arrow_drop_down,
//                                           color:
//                                               Colors.black), // Dropdown arrow
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   'Net Quantity : ',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xff3C3E89),
//                                   ),
//                                 ),
//                                 Container(
//                                   alignment: Alignment.center,
//                                   width: 60,
//                                   height: 25,
//                                   child: TextField(
//                                     decoration: InputDecoration(
//                                       hintText: "50",
//                                       hintStyle: TextStyle(
//                                           fontWeight: FontWeight.bold),
//                                       enabledBorder: UnderlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Colors.blueAccent),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 17),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   'Weight : ',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xff3C3E89),
//                                   ),
//                                 ),
//                                 Container(
//                                   alignment: Alignment.center,
//                                   width: 60,
//                                   height: 25,
//                                   child: TextField(
//                                     decoration: InputDecoration(
//                                       hintText: "100g/ Kg",
//                                       hintStyle: TextStyle(
//                                           fontWeight: FontWeight.bold),
//                                       enabledBorder: UnderlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Colors.blueAccent),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   'Packing Type : ',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xff3C3E89),
//                                   ),
//                                 ),
//                                 Container(
//                                   alignment: Alignment.center,
//                                   width: 60,
//                                   height: 25,
//                                   child: TextField(
//                                     decoration: InputDecoration(
//                                       hintText: "Round",
//                                       hintStyle: TextStyle(
//                                           fontWeight: FontWeight.bold),
//                                       enabledBorder: UnderlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Colors.blueAccent),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 17),
//                         Row(
//                           children: [
//                             Text(
//                               'Added Date :',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xff3C3E89),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Text(
//                               ' 31/02/2025 ',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xff3C3E89),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Icon(
//                               Icons.calendar_month_outlined,
//                               color: Color(0xff3C3E89),
//                             )
//                           ],
//                         ),
//                         const SizedBox(height: 17),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 Get.back();
//                               },
//                               child: Container(
//                                 padding: EdgeInsets.only(
//                                     left: 10, right: 10, top: 5, bottom: 5),
//                                 decoration: BoxDecoration(
//                                   color: Color(0xffff8800),
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                                 child: Text(
//                                   'Cancel',
//                                   style: TextStyle(
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 Get.back();
//                               },
//                               child: Container(
//                                 padding: EdgeInsets.only(
//                                     left: 10, right: 10, top: 5, bottom: 5),
//                                 decoration: BoxDecoration(
//                                   color: Color(0xff01b8fa),
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                                 child: Text(
//                                   'Submit',
//                                   style: TextStyle(
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raxaadmin/utils/images.dart';

class ScreenEditProduct extends StatefulWidget {
  const ScreenEditProduct({super.key});

  @override
  State<ScreenEditProduct> createState() => _ScreenEditProductState();
}

class _ScreenEditProductState extends State<ScreenEditProduct> {
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
              "Edit PRODUCT",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                    'Edit Product',
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
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Text(
                        'Edit Product',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3C3E89),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xffcccccc),
                            thickness: 2, // Use thickness to make it visible
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Container(
                          //   height: 150,
                          //   width: 150,
                          //   color: Colors.red,
                          // ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Edit Product',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff3C3E89),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Hight : 500px',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w200,
                                    color: Color(0xff3C3E89),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Weight : 500px',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w200,
                                    color: Color(0xff3C3E89),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Product Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900],
                              ),
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "JPSR Prabhu Shriram Agarbatti",
                              hintStyle: TextStyle(fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueAccent),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Discrption",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900],
                              ),
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText:
                                  "JPSR Prabhu Shriram Agarbatti Perfume incense sticks....",
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueAccent),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'In Stock : ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff3C3E89),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 60,
                                    height: 25,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blue,
                                          width: 2), // Blue border
                                      borderRadius: BorderRadius.circular(
                                          5), // Rounded corners
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
                                                  fontSize: 12,
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
                                            color:
                                                Colors.black), // Dropdown arrow
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Net Quantity : ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff3C3E89),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 60,
                                    height: 25,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "50",
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blueAccent),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 17),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Weight : ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff3C3E89),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 60,
                                    height: 25,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "100g/ Kg",
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blueAccent),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Packing Type : ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff3C3E89),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 60,
                                    height: 25,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Round",
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blueAccent),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 17),
                          Row(
                            children: [
                              Text(
                                'Added Date :',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff3C3E89),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                ' 31/02/2025 ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff3C3E89),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                Icons.calendar_month_outlined,
                                color: Color(0xff3C3E89),
                              )
                            ],
                          ),
                          const SizedBox(height: 17),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffff8800),
                                    borderRadius: BorderRadius.circular(5),
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
                                  Get.back();
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xff01b8fa),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
