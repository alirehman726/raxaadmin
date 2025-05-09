import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:raxaadmin/Model/model_userList.dart';

class ControllerUserlist extends GetxController {
  RxList<UserList> userList = <UserList>[].obs;
  // var table = [].obs;

  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    controllerUserlist();
  }

  controllerUserlist() async {
    try {
      loading.value = true;
      var request = http.MultipartRequest(
          'GET', Uri.parse('https://raxaspread.com/API/api/getusers'));

      http.Response response =
          await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        print('ALL User List Call');
        loading.value = false;
        userList.value = modelUserListFromJson(response.body).data;
        print(response.body);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("❌ Error fetching tables: $e");
    } finally {
      loading.value = false;
    }
  }
}
