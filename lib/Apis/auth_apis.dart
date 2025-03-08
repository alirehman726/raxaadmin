import 'package:dio/dio.dart' as dio;
import 'package:raxaadmin/Widgets/myToasts.dart';
import 'package:raxaadmin/service/http_service.dart';

import '../service/url.dart';

class AuthApis {
  static FormServiceImpl formService = FormServiceImpl();
  static Future<dio.Response?> loginApi(dio.FormData body) async {
    dio.Response res =
        await formService.postRequest(LOGIN_URL, body, null, null);
    print(res.data);
    print('res.data_________________________________');
    print("URL: HIT");
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      return res;
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      return null;
    }
  }

  static Future<dio.Response?> customerApi(dio.FormData body) async {
    dio.Response res = await formService.postRequest(
        "https://thevegstory.com/tvsadmin/api/add", body, null, null);
    print(res.data);
    print('res.data_________________________________');
    print("URL: HIT");
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      return res;
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      return null;
    }
  }

  static Future<dio.Response?> change_tableApi(dio.FormData body) async {
    dio.Response res = await formService.postRequest(
        "https://thevegstory.com/tvsadmin/api/change-table", body, null, null);
    print(res.data);
    print('res.data_________________________________');
    print("URL: HIT");
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      return res;
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      return null;
    }
  }

  static Future<dio.Response?> addtableApi(dio.FormData body) async {
    dio.Response res = await formService.postRequest(
        "https://thevegstory.com/tvsadmin/api/pickup", body, null, null);
    print(res.data);
    print('res.data_____________add_table____________________');
    print("URL: HIT");
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      return res;
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      return null;
    }
  }

  static Future<dio.Response?> otpVeriApi(dio.FormData body) async {
    dio.Response res = await formService.postRequest(
        "https://thevegstory.com/tvsadmin/api/verify-otp", body, null, null);
    print(res.data);
    print(
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa________________');
    print("URL: HIT");
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      return res;
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      return null;
    }
  }

  static Future<dio.Response?> confirmOrderApi(dio.FormData body) async {
    dio.Response res = await formService.postRequest(
        "https://thevegstory.com/tvsadmin/api/order", body, null, null);
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      return res;
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      return null;
    }
  }

  static Future<dio.Response?> deleteOrderApi(dio.FormData body) async {
    dio.Response res = await formService.postRequest(
        "https://thevegstory.com/tvsadmin/api/remove-order", body, null, null);
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      return res;
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      return null;
    }
  }

  static Future<dio.Response?> insertdata(dio.FormData body) async {
    dio.Response res =
        await formService.postRequest(INCOME_EXPENCE_URL, body, null, null);
    print(res.data);
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      return res;
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      return null;
    }
  }

  static Future<dio.Response?> finalbillApi(
      dio.FormData body, String token) async {
    print(token);
    print("Agharia Zakirhussain");
    dio.Response res =
        await formService.postRequest(FINAL_URL, body, token, null);
    print(res);
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      return res;
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      // longToastMessage(res.data["message"]);
      return null;
    }
  }

  static Future<dio.Response?> googleLogin(dio.FormData body) async {
    dio.Response res =
        await formService.postRequest(GOOGLE_URL, body, null, null);
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      return res;
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      return null;
    }
  }

  static Future<dio.Response?> signUpApi(dio.FormData body) async {
    dio.Response res =
        await formService.postRequest(SIGNUP_URL, body, null, null);
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      return res;
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      // longToastMessage(res.data["message"]);
      return null;
    }
  }

  static Future<dio.Response?> signupProfileApi(dio.FormData body) async {
    dio.Response res =
        await formService.putRequest(SIGNUPMOBILE_URL, body, null, null);
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      return res;
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      return null;
    }
  }

  static Future<dio.Response?> updateProfileAPI(
      dio.FormData body, token, options) async {
    dio.Response res =
        await formService.putRequest(UPDATE_PROFILE_URL, body, token, options);
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      return res;
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      return null;
    }
  }

  static Future<dio.Response?> forgotPasswordApi(dio.FormData body) async {
    dio.Response res =
        await formService.postRequest(FORGOTPASSWORD_URL, body, null, null);
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      return res;
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      return null;
    }
  }

  static Future<dio.Response?> sendOTPApi(dio.FormData body) async {
    dio.Response res =
        await formService.postRequest(SENDOTP_URL, body, null, null);
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      // if (res.data["status"] == true) {
      //   longToastMessage(res.data["message"]);
      //   return res;
      // } else if (res.data["status"] == false) {
      //   longToastMessage(res.data["message"]);
      // } else {
      //   longToastMessage("Invalid Mobile Number....");
      // }
      return res;
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      longToastMessage(res.data["message"]);
      return null;
    }
  }

  static Future<dio.Response?> mobileLogin(dio.FormData body) async {
    dio.Response res =
        await formService.postRequest(MOBILELOGIN_URL, body, null, null);
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      // if (res.data["status"] == true) {
      //   longToastMessage(res.data["message"]);
      //   return res;
      // } else if (res.data["status"] == false) {
      //   longToastMessage(res.data["message"]);
      // } else {
      //   longToastMessage("Invalid Mobile Number....");
      // }
      return res;
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      longToastMessage(res.data['message']);
      return null;
    }
  }

  /// ========== Change Password API ==========
  /// @param dio.FormData body
  /// @return Future<dio.Response> response
  static Future<dio.Response?> changePasswordApi(
      dio.FormData body, token) async {
    dio.Response res =
        await formService.postRequest(CHANGE_PASS_URL, body, token, null);
    print("Change Password API Called");
    print(res);
    if (res.statusCode! >= 200 && res.statusCode! <= 210) {
      if (res.data["status"] == true) {
        longToastMessage(res.data["message"]);
        return res;
      } else if (res.data["status"] == false) {
        longToastMessage(res.data["message"]);
      } else {
        longToastMessage(
            "Unknown error occured. Please try again after sometime.");
      }
    } else if (res.statusCode! >= 400 && res.statusCode! <= 403) {
      longToastMessage(res.data["message"]);
      return null;
    }
  }
}
