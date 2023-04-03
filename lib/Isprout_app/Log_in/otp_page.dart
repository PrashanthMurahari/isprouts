import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OneTimePassword extends StatefulWidget {
  final String userNumber;
  const OneTimePassword(this.userNumber, {super.key});

  @override
  State<OneTimePassword> createState() =>
      _OneTimePasswordState();
}
class _OneTimePasswordState extends State<OneTimePassword> {
  final TextEditingController oneTimePassword =TextEditingController();
  _OneTimePasswordState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 20.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Image(
                  image: AssetImage('isprout.png'),
                  width: 200.0,
                  height: 200.0,),
                const SizedBox(height: 30),
                 Pinput(length: 6,
                  controller: oneTimePassword,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,),
                const SizedBox(height: 30,),
                SizedBox(width: 100.0, height: 40.0,
                  child: ElevatedButton(
                      onPressed: () {
                        if (widget.userNumber=='1234567890' && (oneTimePassword.length==6 && oneTimePassword.text =='123456')){
                          Navigator.pushNamed(context, '/dashboard');
                        }
                      },
                      child: const Text(
                        'Verify',
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Edit Mobile Number?',
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
        ));
  }
}