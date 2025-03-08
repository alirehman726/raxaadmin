import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raxaadmin/utils/images.dart';

class ScreenProductsDetails extends StatefulWidget {
  @override
  _ScreenProductsDetailsState createState() => _ScreenProductsDetailsState();
}

class _ScreenProductsDetailsState extends State<ScreenProductsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          "PRODUCT DETAIL",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff01B8FA),
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: constraints.maxHeight * .4 + 90,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff01B8FA),
                              Color(0xff3C3E89),
                            ], // 2 colors mix
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * 0.3,
                      ),
                    ),
                    Positioned(
                      top: constraints.maxHeight * .01,
                      left: 30,
                      right: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Container(
                          height: constraints.maxHeight * 0.50,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            image: DecorationImage(
                              image: AssetImage(Images.PRODUCTS),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'JAL ( RAXA AGARBATTI )',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff3C3E89),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '₹ 250.00',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff01B8FA),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              Divider(),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'PRODUCT INFORMATION',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3C3E89),
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 10),
              productInfoRow("Weight", "110 Gm"),
              SizedBox(height: 10),
              productInfoRow("Packing", "Zipper Pack"),
              SizedBox(height: 10),
              productInfoRow("MRP", "58 Rs"),
              SizedBox(height: 10),
              productInfoRow("Flavour", "Miracal"),
              SizedBox(height: 10),
              productInfoRow("Burning Time", "45 Minutes"),
            ],
          ),
        ),
      ),
    );
  }

  Widget productInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xff3C3E89),
              )),
          Text(
            value,
            style: TextStyle(
              color: Color(0xff01B8FA),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(200.0),
//           child: AppBar(
//             leading: IconButton(
//               icon: Icon(
//                 Icons.arrow_back_ios_new_rounded,
//                 color: Colors.white,
//               ),
//               onPressed: () {},
//             ),
//             title: Text(
//               "Custom AppBar",
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             centerTitle: true,
//             flexibleSpace: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color(0xff01B8FA),
//                     Color(0xff3C3E89),
//                   ], // 2 colors mix
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//             ),
//             backgroundColor:
//                 Colors.transparent, // Transparent rakhna zaroori hai
//             elevation: 0, // Shadow hatane ke liye
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.only(left: 20, right: 20),
//           child: Stack(
//             children: [
//               Positioned(
//                 top: -150,
//                 left: 20,
//                 right: 20,
//                 child: Container(
//                   height: 300,
//                   width: double.infinity,
//                   child: Image.asset(
//                     Images.PRODUCTS,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
