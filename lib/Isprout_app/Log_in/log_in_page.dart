import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:isprouts/Isprout_app/Log_in/otp_page.dart';
class LogIn extends StatefulWidget {
  const LogIn({super.key});
  @override
  State<LogIn> createState() => _LogInState();
}
class _LogInState extends State<LogIn> {
  @override
  void initState() {
    super.initState();
  }
  final TextEditingController _numberController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: '91',
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "INDIA",
    example: 'INDIA',
    displayName: 'INDIA',
    displayNameNoCountryCode: 'IN',
    e164Key: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 20.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60.0,
              ),
              const Image(
                image: AssetImage('isprout.png'),
                width: 200.0,
                height: 200.0,
              ),
              const SizedBox(height: 30.0),
              Column(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            controller: _numberController,
                            cursorColor: Colors.deepOrangeAccent,
                            decoration: InputDecoration(
                              hintText: 'Mobile Number',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    showCountryPicker(
                                        context: context,
                                        countryListTheme:
                                            const CountryListThemeData(
                                                bottomSheetHeight: 400),
                                        onSelect: (value) {
                                          setState(() {
                                            selectedCountry = value;
                                          });
                                        });
                                  },
                                  child: Text(
                                    '${selectedCountry.flagEmoji}+${selectedCountry.phoneCode}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OneTimePassword(_numberController.text)),
                        );
                      },
                      child: const Text(
                        'Send the OTP',
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
