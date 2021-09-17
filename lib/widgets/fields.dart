import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  String labelText;
  String hinTtext;
  // String errorReturn;
  String onSave;
  TextEditingController textEditingController;

  Field(
      {this.labelText, this.hinTtext, this.onSave, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: new ThemeData(
        hintColor: Color(0xFF01dcdc),
        primaryColor: Color(0xFF01dcdc),
        primaryColorDark: Color(0xFF01dcdc),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
        child: TextFormField(
          controller: textEditingController,
          keyboardType: TextInputType.text,
          decoration: new InputDecoration(
            hintText: hinTtext,
            hintStyle: TextStyle(
                color: Color(0xFF01dcdc), fontStyle: FontStyle.italic),
            labelText: labelText,
            fillColor: Colors.black,
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(color: Color(0xFF01dcdc))),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return "Field is empty";
            }
            return null;
          },
          onSaved: (String onSave) {},
        ),
      ),
    );
  }
}
