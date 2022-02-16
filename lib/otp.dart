import 'package:dira_00/login.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:developer';

class otp extends StatefulWidget {
  const otp({Key? key}) : super(key: key);

  @override
  _otpState createState() => _otpState();
}

class _otpState extends State<otp> {

  late final String  otpnumber;

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Column(
        children: [
          Container(
            height:100,
            width:MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Flexible(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: const Color(0xff000000),
                borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0)),
              ),
              child: Column(
                children: [
                  Image.asset('assets/otp.png'),

                  Container(

                    child: Form(

                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 30),
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 6,


                            blinkWhenObscuring: true,
                            animationType: AnimationType.fade,
                            validator: (v) {
                              if (v!.length < 3) {
                                return "I'm from validator";
                              } else {
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 40,
                              activeFillColor: Colors.white,
                            ),
                            cursorColor: Colors.black,
                            animationDuration: Duration(milliseconds: 300),
                            enableActiveFill: true,

                            keyboardType: TextInputType.number,
                            boxShadows: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black12,
                                blurRadius: 10,
                              )
                            ],
                            onCompleted: (v) {
                              log(v);
                              setState(() {
                                otpnumber=v;
                              });
                            },
                            // onTap: () {
                            //   print("Pressed");
                            // },
                            onChanged: (value) {
                              print(value);
                              setState(() {

                              });
                            },
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FlatButton(
                      onPressed: () {
                        log('On Saved: $otpnumber');
                        Navigator.pushNamed(context, '/homepage');
                      },
                      height:50,
                      minWidth:200,
                      color: Colors.orange,
                      child: Text("Submit",
                        style:TextStyle(
                          color:Colors.white,
                        ),
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child:InkWell(
                      child: Text(
                        "Resend OTP ?",
                        style:TextStyle(
                          color:Colors.red,
                          fontSize:20,
                          fontStyle:FontStyle.italic,

                        ),
                      ),
                      onTap: (){
                        log("jiii");
                      },
                    ),

                  )

                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
