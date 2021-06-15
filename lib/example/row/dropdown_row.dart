import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: DropdownSearch<String>(
            validator: (v) => v == null ? "required field" : null,
            hint: "Select a country",
            mode: Mode.MENU,
            dropdownSearchDecoration: InputDecoration(
              filled: true,
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF01AFBBC)),
              ),
            ),
            showAsSuffixIcons: true,
            clearButtonBuilder: (_) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.clear,
                size: 24,
                color: Colors.black,
              ),
            ),
            dropdownButtonBuilder: (_) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.arrow_drop_down,
                size: 24,
                color: Colors.black,
              ),
            ),
            showSelectedItem: true,
            items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
            label: "Menu mode *",
            showClearButton: true,
            onChanged: print,
            popupItemDisabled: (String s) => s.startsWith('I'),
            selectedItem: "Tunisia",
          ),
        ),
        Expanded(
            child: TextField(
          decoration: InputDecoration(
            filled: true,
            labelText: "Menu mode *",
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF01689A)),
            ),
          ),
        ))
      ],
    );
  }
}
