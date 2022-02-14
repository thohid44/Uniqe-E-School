import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'CustomService.dart';

class RegistrationController extends GetxController {
  String stdname = "";
  String stdemail = "";
  String stdpass = "";
  signUpUser(String name, String email, String password) async {
    stdname = name;

    stdemail = email;
    stdpass = password;

    // print(stdemail);
    // // print(stdpass);

    // Future<void> sendUserDataToServer() async {
    Map<String, dynamic> dataBody = {
      CustomWebServices.std_name: stdname,
      CustomWebServices.std_email: stdemail,
      CustomWebServices.std_pass: stdpass
    };

    // API data send and receive by json format

    var dataToSend = json.encode(dataBody);

    var response = await http.post(Uri.parse(CustomWebServices.signup_api_url),
        body: dataToSend);

    print(response.body);
  }
}
