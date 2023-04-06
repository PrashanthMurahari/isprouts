import 'package:flutter/material.dart';

class EditingButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const EditingButton(this.text, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(5),
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
          minimumSize: const Size(120, 40),
        ),
        onPressed: onPressed,
        child: Text(text));
  }
}
