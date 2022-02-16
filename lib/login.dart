import 'package:dira_00/otp.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'dart:developer';



class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  late String MobileNumber;
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:Colors.black,

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height:300,
            width:MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0xff000000),
              borderRadius:  BorderRadius.only(
                  bottomLeft: Radius.circular(75.0),
            ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/logo.png'),
                ),
                Center(
                    child: Text(
                      'Login',
                      textAlign:TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                ),
              ],
            ),
          ),

          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child:Column(
                  children: [
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        var pan=number.phoneNumber;
                        log('$pan');
                        setState((){
                          MobileNumber=pan!;
                        });

                      },

                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: number,
                      keyboardType:
                      TextInputType.numberWithOptions(signed: true, decimal: true),
                      inputBorder: OutlineInputBorder(),
                      onSaved: (PhoneNumber number) {
                        log('On Saved: $number');
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FlatButton(
                        onPressed: () {
                          log('On Saved: $MobileNumber');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>otp()),
                          );
                        },
                        height:50,
                        minWidth:200,
                        color: Colors.black,
                        child: Text("Submit",
                          style:TextStyle(
                            color:Colors.white,
                          ),
                        ),

                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }






}





