import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
class OneTimePassword extends StatefulWidget {
  const OneTimePassword({Key? key}) : super(key: key);
  @override
  State<OneTimePassword> createState() => _OneTimePasswordState();
}
class _OneTimePasswordState extends State<OneTimePassword> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pushNamed(context, '/login');
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 20.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60.0,),
              const Image(image:  AssetImage('isprout.png') ,
                width: 200.0,
                height: 200.0,

              ),
              const SizedBox(height:30.0),
          Pinput(
            length: 6,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) => print(pin),
          ),
              const SizedBox(height: 30.0,),
              Container(
                width: 100.0,
                height: 40.0,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/dashboard');
                    },
                    child: const Text('Verify',)),
              ),
              SizedBox(height: 20.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, '/login');
                    },
                      child: Text('Edit Mobile Number?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,

                    ),

                    ),
                    ),
                  ],
                ),

            ],
          ),
        ),
      )
    );
  }
}