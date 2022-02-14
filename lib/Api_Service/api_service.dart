import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TestCon extends GetxController {
  var isDataLoadingCompleted = false.obs;
  List sscPhyList = [].obs;
  final baseUrl = "http://app.chadahatti.org/course_types";

  void onInit() {
    physicsdata();
    super.onInit();
  }

  Future physicsdata() async {
    var response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      isDataLoadingCompleted = true.obs;

      sscPhyList = data.toList();
    } else {
      Get.snackbar("Error", "Error while commincating with API");
    }
  }
}

// class ApiService {
//   static var client = http.Client();
//   static fetchCourse() async {
//     var respo =
//         await client.get(Uri.parse("http://app.chadahatti.org/course_types"));

//     if (respo.statusCode == 200) {
//       var data = jsonDecode(respo.body);

//       print(data);
//     } else {
//       print("No response");
//     }
//   }
// }
