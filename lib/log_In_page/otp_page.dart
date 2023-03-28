import 'package:flutter/material.dart';
import 'package:isprouts/log_In_page/admins_dashboard.dart';
import 'package:pinput/pinput.dart';

class OneTimePassword extends StatefulWidget {
  final String userNumber;
  const OneTimePassword(this.userNumber, {super.key});
  @override
  State<OneTimePassword> createState() =>
      _OneTimePasswordState();
}
class _OneTimePasswordState extends State<OneTimePassword> {
  List<String> listOfAdminNumbers = ["9573977890", "9381419853"];
  List<String> listOfSalesPersonsNumbers = ["1234567890"];
  List<String> listOfReceptionistsNumbers = ["0987654321"];
  List<String> listOfUsersNumbers = ["7418529630"];
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
                const SizedBox(height: 60),
                const Image(
                  image: AssetImage('isprout.png'),
                  width: 200.0,
                  height: 200.0,),
                const SizedBox(height: 30),
                const Pinput(length: 6, showCursor: true,),
                const SizedBox(height: 30,),
                SizedBox(width: 100.0, height: 40.0,
                  child: ElevatedButton(
                      onPressed: () {
                        if (listOfUsersNumbers.contains(widget.userNumber)) {
                          Navigator.pushNamed(context, '/user_dashboard');
                        } else if (listOfAdminNumbers.contains(widget.userNumber)) {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                  AdminsDashboard(widget.userNumber)),
                          );
                        } else if (listOfSalesPersonsNumbers.contains(widget.userNumber)) {
                          Navigator.pushNamed(context, '/sales_persons_dashboard');
                        } else {
                          Navigator.pushNamed(
                              context, '/receptionists_dashboard');
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
                        Navigator.pushNamed(context, '/login');
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