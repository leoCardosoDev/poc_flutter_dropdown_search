import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropString extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      validator: (v) => v == null ? "required field" : null,
      hint: "Select a country",
      mode: Mode.DIALOG,
      showSelectedItem: true,
      items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
      label: "Menu mode *",
      showClearButton: true,
      onChanged: print,
      popupItemDisabled: (String s) => s.startsWith('I'),
      selectedItem: "Tunisia",
      onBeforeChange: (a, b) {
        AlertDialog alert = AlertDialog(
          title: Text("Are you sure..."),
          content: Text("...you want to clear the selection"),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            FlatButton(
              child: Text("NOT OK"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );

        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            });
      },
    );
  }
}
