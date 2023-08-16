import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String? hintText;
  TextEditingController? inputController;
  TextInputType? inputType;
  Function(String)? onChanged;
  int? maxLength;
  CustomTextField({
    super.key,
    this.hintText,
    this.inputController,
    this.inputType,
    this.onChanged,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(
        width: 1,
        color: Colors.black,
      )),
      child: TextFormField(
        controller: inputController,
        keyboardType: inputType,
        onChanged: onChanged,
        maxLength: maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(
              color: Colors.grey.shade700,
              width: 1,
            ),
          ),
          labelText: hintText,
          labelStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
