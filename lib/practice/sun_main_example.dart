import 'package:flutter/material.dart';

void main() =>runApp(const MaterialApp(
  home: SubMainProject(),
));

class SubMainProject extends StatefulWidget {
  const SubMainProject({Key? key}) : super(key: key);

  @override
  State<SubMainProject> createState() => _SubMainProjectState();
}

class _SubMainProjectState extends State<SubMainProject> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
