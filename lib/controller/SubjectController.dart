import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SubjectController extends GetxController {
  List<SubjectModel> subjectList = <SubjectModel>[].obs;

  var subjectClient = http.Client();
  var subjectBaseUrl = "app.chadahatti.org";

  Future<List<SubjectModel>> fetchSubject(id) async {
    var response =
        await subjectClient.get(Uri.https(subjectBaseUrl, 'subject/$id'));

    var subject = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in subject) {
        SubjectModel subject = SubjectModel(id: i['id'], subject: i['subject']);

        subjectList.add(subject);
      }
      return subjectList;
    } else {
      return subjectList;
    }
  }
}

class SubjectModel {
  String? id;
  String? subject;

  SubjectModel({required this.id, required this.subject});
}
