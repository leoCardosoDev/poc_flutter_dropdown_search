import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../example/row/dropdown_row.dart';

// import '../example/string/dropdown_string.dart';
// import '../example/string/dropdown_string2.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DropdownSearch Demo")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          // child: DropStringTwo(openDropDownProgKey: openDropDownProgKey),
          child: Column(
            children: [
              // DropString(),
              Divider(),
              DropRow(),
            ],
          ),
        ),
      ),
    );
  }
}
