import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:oyelabs_task/screens/otp_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String dialCodeDigits = "00";
  //texteditingcontroller
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, children: <Widget>[
         SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              Container(
                //padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                child: Image.asset('loginscreen.png', width: 600, height: 450),

              ),
              Container(
                margin: EdgeInsets.only(top: 0),
                //child: Center(
                  child: Text(
                    "Enter Phone Number",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
             // ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 400,
                height: 60,
                child: CountryCodePicker(
                  onChanged: (country) {
                    setState(() {
                      dialCodeDigits = country.dialCode!;
                    });
                  },
                  initialSelection: "US",
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  favorite: ["+1", "US", "+91", "IND"],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Phone Number',
                        prefix: Padding(
                          padding: EdgeInsets.fromLTRB(14, 5, 14, 6),
                          child: Text(dialCodeDigits),
                        )
                        ),
                    maxLength: 12,
                    keyboardType: TextInputType.number,
                    controller: _controller,
                  )),
              Container(
                margin: EdgeInsets.all(15),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (c) => OTPControllerScreen(phone:
                    _controller.text,
                    codeDigits: dialCodeDigits,)));
                    
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),]
      ),
    );
  }
}
