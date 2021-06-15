import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropStringTwo extends StatelessWidget {
  final GlobalKey<DropdownSearchState<String>> openDropDownProgKey;

  DropStringTwo({this.openDropDownProgKey});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(4),
      children: <Widget>[
        DropdownSearch<String>(
          items: ["no action", "confirm in the next dropdown"],
          label: "open another dropdown programmatically",
          onChanged: (String v) {
            if (v == "confirm in the next dropdown") {
              openDropDownProgKey.currentState.openDropDownSearch();
            }
          },
        ),
        Padding(padding: EdgeInsets.all(4)),
        DropdownSearch<String>(
          key: openDropDownProgKey,
          items: ["Yes", "No"],
          label: "confirm",
          showSelectedItem: true,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            RaisedButton(
                onPressed: () {
                  openDropDownProgKey.currentState.openDropDownSearch();
                },
                color: Theme.of(context).accentColor,
                child: Text("Open dropdownSearch")),
            RaisedButton(
                onPressed: () {
                  openDropDownProgKey.currentState.changeSelectedItem("No");
                },
                child: Text("set to 'NO'")),
            Material(
              child: RaisedButton(
                  onPressed: () {
                    openDropDownProgKey.currentState.changeSelectedItem("Yes");
                  },
                  child: Text("set to 'YES'")),
            ),
            RaisedButton(
                onPressed: () {
                  openDropDownProgKey.currentState.changeSelectedItem("Blabla");
                },
                child: Text("set to 'Blabla'")),
          ],
        )
      ],
    );
  }
}
