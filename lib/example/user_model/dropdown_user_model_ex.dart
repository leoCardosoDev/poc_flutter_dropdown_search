import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../../model/user_model.dart';

class DropUserEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<UserModel>(
      items: [
        UserModel(name: "Offline name1", id: "999"),
        UserModel(name: "Offline name2", id: "0101")
      ],
      maxHeight: 300,
      onFind: (String filter) => getData(filter),
      label: "choose a user",
      onChanged: print,
      showSearchBox: true,
    );
  }

  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "http://5d85ccfb1e61af001471bf60.mockapi.io/user",
      queryParameters: {"filter": filter},
    );

    List<UserModel> models = UserModel.fromJsonList(response.data);
    return models;
  }
}
