import 'dart:convert';

import 'package:e_unique_school/auth/Login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'CustomService.dart';

class RegistrationController extends GetxController {
  String stdname = "";
  String stdmobile = "";
  String stdpass = "";
  signUpUser(String name, String mobile, String password) async {
    stdname = name;

    stdmobile = mobile;
    stdpass = password;

    // print(stdemail);
    // // print(stdpass);

    // Future<void> sendUserDataToServer() async {
    Map<String, dynamic> dataBody = {
      CustomWebServices.std_name: stdname,
      CustomWebServices.std_mobile: stdmobile,
      CustomWebServices.std_pass: stdpass
    };

    // API data send and receive by json format

    var dataToSend = json.encode(dataBody);

    var response = await http.post(Uri.parse(CustomWebServices.signup_api_url),
        body: dataToSend);
    Get.snackbar(
      "Done",
      "Successfully Registered",
      snackPosition: SnackPosition.TOP,
      showProgressIndicator: true,
    );
    Get.to(Login());
  }
}
