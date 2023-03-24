import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});
  @override
  State<LogIn> createState() => _LogInState();
}
class _LogInState extends State<LogIn> {
  TextEditingController countryCode = TextEditingController();
  @override
  void initState()
  {
    countryCode.text ='+91';
   super.initState();
}
  final TextEditingController _nameController = TextEditingController();
  var number="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 20.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60.0,),
              const Image(image: AssetImage('isprout.png') ,
              width: 200.0,
                height: 200.0,
              ),
              const SizedBox(height:30.0),
              Container(
                margin:const EdgeInsets.fromLTRB(200.0, 0.0, 200.0, 0.0),
                padding:const EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 1,color:Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                      SizedBox(
                      width: 40.0,
                      child:  TextField(
                        controller: countryCode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                      child:  Text('|',
                      style:  TextStyle(
                        color: Colors.grey,
                        fontSize: 40.0,
                      ),
                      ),
                    ),
                     Expanded(child:  TextFormField(
                       keyboardType: TextInputType.number,
                       onChanged: (value){
                          number = value;
                       },
                      controller : _nameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,labelText: 'Mobile Number',
                      ),

                    ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0,),
              SizedBox(
                width: 150.0,
                height: 40.0,
                child: ElevatedButton(
                    onPressed: () async{
                      // ignore: prefer_typing_uninitialized_variables

                      await FirebaseAuth.instance.verifyPhoneNumber(

                        phoneNumber: '${countryCode.text+number}',
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                           Navigator.pushNamed(context, '/otp');                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                      // ignore: use_build_context_synchronously

                    },
                    child: const Text('Send the OTP',
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}