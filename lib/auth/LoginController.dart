import 'dart:convert';
import 'package:e_unique_school/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'CustomService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  singIn(String email, String password) async {
    // print(stdemail);
    // // print(stdpass);

    // Future<void> sendUserDataToServer() async {

    Map<String, dynamic> dataBody = {
      CustomWebServices.std_email: email,
      CustomWebServices.std_pass: password
    };

    // API data send and receive by json format

    var dataToSend = json.encode(dataBody);

    var response = await http.post(Uri.parse(CustomWebServices.signin_api_url),
        body: dataToSend);
    if (response.statusCode == 200) {
      Map<String, dynamic> resData = jsonDecode(response.body);
      print(resData['student_id']);
      if (resData['status'] == true) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        Map<String, dynamic> userdata = {
          "studentId": resData['student_id'].toString(),
        };
        sharedPreferences.setString("sharedata", json.encode(userdata));

        Get.to(HomePage());
      } else {
        Get.snackbar("Message", "Email id not match");
      }
    } else {
      Get.snackbar(
        "Sign IN Failed",
        "",
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    }
  }
}
