import 'dart:convert';

import 'package:e_unique_school/model/group_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GroupController extends GetxController {
  List<GroupModel> groupList = <GroupModel>[].obs;
  var isDataLoadingCompleted = false.obs;
  var url = "app.chadahatti.org";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement
    groupList.clear();
    super.dispose();
  }

  var client = http.Client();
  Future<List<GroupModel>> fetchGroup(rec) async {
    groupList.clear();
    var response = await client.get(Uri.https(url, 'group/$rec'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        GroupModel groups = GroupModel(
          id: i['id'].toString(),
          group: i['group'].toString(),
        );

        groupList.add(groups);
      }
      isDataLoadingCompleted = true.obs;
      return groupList;
    } else {
      return groupList;
    }
  }
}
