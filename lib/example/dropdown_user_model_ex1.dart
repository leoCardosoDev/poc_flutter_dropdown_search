import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_poc_dropdown_search/example/user_model.dart';

class DropUserEx1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<UserModel>(
      searchBoxController: TextEditingController(text: 'Mrs'),
      mode: Mode.BOTTOM_SHEET,
      isFilteredOnline: true,
      showClearButton: true,
      showSearchBox: true,
      label: 'User *',
      dropdownSearchDecoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
      ),
      autoValidateMode: AutovalidateMode.onUserInteraction,
      validator: (UserModel u) => u == null ? "user field is required " : null,
      onFind: (String filter) => getData(filter),
      onChanged: (UserModel data) {
        print(data);
      },
      dropdownBuilder: _customDropDownExample,
      popupItemBuilder: _customPopupItemBuilderExample,
    );
  }

  Widget _customDropDownExample(
      BuildContext context, UserModel item, String itemDesignation) {
    return Container(
      child: (item?.avatar == null)
          ? ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(),
              title: Text("No item selected"),
            )
          : ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.avatar),
              ),
              title: Text(item.name),
              subtitle: Text(
                item.createdAt.toString(),
              ),
            ),
    );
  }

  Widget _customPopupItemBuilderExample(
      BuildContext context, UserModel item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.name),
        subtitle: Text(item.createdAt.toString()),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item.avatar),
        ),
      ),
    );
  }

  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "http://5d85ccfb1e61af001471bf60.mockapi.io/user",
      queryParameters: {"filter": filter},
    );

    var models = UserModel.fromJsonList(response.data);
    return models;
  }
}
