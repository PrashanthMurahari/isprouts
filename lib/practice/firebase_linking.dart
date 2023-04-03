import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
void main() async{
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MaterialApp (
    debugShowCheckedModeBanner: false,
    home: AppPage(),
  ));
}
class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);
  @override
  State<AppPage> createState() => _AppPageState();
}
class _AppPageState extends State<AppPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late String nameValue;
  late String ageValue;
  late String companyValue;
  late String emailValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            TextFormField(
              onChanged: (value){
                nameValue=value;
              },
              decoration:  InputDecoration(hintText: 'enter name',
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            TextFormField(
              onChanged: (value){
                ageValue=value;
              },
              decoration:  InputDecoration(hintText: 'enter age',
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            TextFormField(
              onChanged: (value){
                companyValue=value;
              },
              decoration:  InputDecoration(hintText: 'enter company',
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            TextFormField(
              onChanged: (value){
                emailValue=value;
              },
              decoration:  InputDecoration(hintText: 'enter email',
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: ()async{
                  await   users.add({
                    'name': nameValue,
                    'age':ageValue,
                    'company':companyValue,
                    'email':emailValue,
                  } ).then((value) {

                  });
                },
                child: const Text('add'))
          ],
        ),
      ),
    );
  }
}
