import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

void main() => runApp(MaterialApp(
  home: MyProject()
));

class MyProject extends StatefulWidget {
  const MyProject({Key? key}) : super(key: key);

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  final TextEditingController numbercontroller =TextEditingController();
  Country selectedcountry = Country(
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
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              child: TextFormField(
                controller: numbercontroller,
                cursorColor: Colors.deepOrangeAccent,
                decoration: InputDecoration(
                  hintText: 'Mobile Number',
                  enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        showCountryPicker(context: context,
                            countryListTheme:  CountryListThemeData(bottomSheetHeight: 400),
                            onSelect:(value){
                          setState(() {
                            selectedcountry = value;
                          });
                            });
                      },
                      child: Text(
                          '${selectedcountry.flagEmoji}+${selectedcountry.phoneCode}'
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

