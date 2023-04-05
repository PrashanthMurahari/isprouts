import 'package:flutter/material.dart';

abstract class InputPage<T> extends State{
  Widget textField(TextEditingController controller, String text){
    return
       TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
        ),

    );
  }
}