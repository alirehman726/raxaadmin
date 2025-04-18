import 'package:flutter/widgets.dart'; // 🔥 Required for addPostFrameCallback
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:raxaadmin/Model/ModelAllProducts.dart';

class ControllerAllproducts extends GetxController {
  RxList<AllProducts> allProducts = <AllProducts>[].obs;
  RxBool loading = false.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   // 🔥 API कॉल को UI Build के बाद रन कराने के लिए
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     controllerAllProducts();
  //   });
  // }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 100));
      controllerAllProducts();
    });
  }

  Future<void> controllerAllProducts() async {
    try {
      // ✅ Delay the first reactive update just a bit
      await Future.delayed(Duration(milliseconds: 10));
      loading.value = true;

      var request = http.MultipartRequest(
          'GET', Uri.parse('https://raxaspread.com/API/api/activeproduct'));

      http.Response response =
          await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        print('✅ API Call Success');

        var products = modelAllProductsFromJson(response.body).data;

        if (products.isNotEmpty) {
          allProducts.assignAll(products);
        } else {
          allProducts.clear();
        }
        print(response.body);
      } else {
        print("❌ API Error: ${response.reasonPhrase}");
      }
    } catch (e) {
      print("❌ Error fetching products1: $e");
    } finally {
      // ✅ Delay to avoid Obx rebuilding too soon
      await Future.delayed(Duration(milliseconds: 300));
      loading.value = false;
    }
  }
}
