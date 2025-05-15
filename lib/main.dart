import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:raxaadmin/Controller/controller.ads.dart';
import 'package:raxaadmin/Controller/controller_AllDealer.dart';
import 'package:raxaadmin/Controller/controller_EditDealer.dart';
import 'package:raxaadmin/Controller/controller_OneProducts.dart';
import 'package:raxaadmin/Controller/controller_allAds.dart';
import 'package:raxaadmin/Controller/controller_allOrder.dart';
import 'package:raxaadmin/Controller/controller_allProducts.dart';
import 'package:raxaadmin/Controller/controller_city.dart';
import 'package:raxaadmin/Controller/controller_dealerReport.dart';
import 'package:raxaadmin/Controller/controller_product.dart';
import 'package:raxaadmin/Controller/controller_userList.dart';
import 'package:raxaadmin/Controller/controller_viewAds.dart';
import 'package:raxaadmin/Notification/local_notification_service.dart';
import 'package:raxaadmin/screen/LacaleString.dart';
import 'package:raxaadmin/screen/screen_view_order.dart';
import 'package:raxaadmin/screen/splash_screen.dart';
import 'package:raxaadmin/utils/color.dart';

import 'Controller/controller_view_order.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Screen Util Initialize
  await ScreenUtil.ensureScreenSize();
  HttpOverrides.global = MyHttpOverrides();

  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  // Get.put(DashboardController());
  Get.put(ControllerAllproducts());
  Get.put(ControllerAds());
  Get.put(ControllerCity());
  Get.put(Controllerproducts());
  Get.put(ControllerOneproducts());
  Get.put(ControllerAllOrder());
  Get.put(ControllerViewOrder());
  Get.put(ControllerAllAds());
  Get.put(ControllerViewAds());
  Get.put(ControllerAllDealer());
  Get.put(ControllerEditDealer());
  Get.put(ControllerDealerreport());
  Get.put(ControllerUserlist());
  runApp(const MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(
//         const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

//     final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//     @override
//     void initState() {
//       super.initState();

//       FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//         final data = message.data;
//         if (data['type'] == 'offer') {
//           navigatorKey.currentState?.push(
//             MaterialPageRoute(
//               builder: (_) => ScreenViewOrder(id: data['offerId']),
//             ),
//           );

//           //  Get.to(() => ScreenViewOrder(
//           //                                     id: controllerAllOrder
//           //                                         .allOrder[index].id));
//         }
//       });
//     }

//     return ScreenUtilInit(
//       child: GetMaterialApp(
//         title: "Raxa Admin",
//         debugShowCheckedModeBanner: false,
//         translations: LocaleString(),
//         locale: Locale('en', 'US'),
//         theme: ThemeData(
//             fontFamily: "Poppins",
//             primarySwatch: Colors.grey,
//             scaffoldBackgroundColor: scaffoldColor,
//             appBarTheme: AppBarTheme(
//               color: white,
//               centerTitle: true,
//               elevation: 0,
//             )),
//         home: SplashScreen(),
//       ),
//     );
//   }
// }

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(); // Global navigatorKey

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // For foreground/background message click
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      final data = message.data;

      print('Notification clicked (background/foreground): $data');

      final orderId = data['order_id'];
      final screen = data['screen'];

      if (screen == "order_view" && orderId != null) {
        navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (_) => ScreenViewOrder(id: int.parse(orderId)),
            // builder: (_) => ScreenViewOrder(id: orderId),
          ),
        );
      }
    });

    // For terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final data = message.data;

        print('Notification clicked (terminated): $data');

        final orderId = data['order_id'];
        final screen = data['screen'];

        if (screen == "order_view" && orderId != null) {
          navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (_) => ScreenViewOrder(id: int.parse(orderId)),
              // builder: (_) => ScreenViewOrder(id: orderId),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return ScreenUtilInit(
      child: GetMaterialApp(
        navigatorKey: navigatorKey, // Required for redirection
        title: "Raxa Admin",
        debugShowCheckedModeBanner: false,
        translations: LocaleString(),
        locale: const Locale('en', 'US'),
        theme: ThemeData(
          fontFamily: "Poppins",
          primarySwatch: Colors.grey,
          scaffoldBackgroundColor: scaffoldColor,
          appBarTheme: AppBarTheme(
            color: white,
            centerTitle: true,
            elevation: 0,
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
