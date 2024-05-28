import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:todoapp/pages/signup.dart';
import 'package:todoapp/service/AuthService.dart';

class MobileAuth extends StatefulWidget {
  const MobileAuth({super.key});

  @override
  State<MobileAuth> createState() => _MobileAuthState();
}

class _MobileAuthState extends State<MobileAuth> {
  int start = 30;
  Timer? _timer;
  String verificationId = "";
  String smsCode = "";
  AuthClass auth = AuthClass();
  TextEditingController phoneController = TextEditingController();

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (start == 0) {
          timer.cancel();
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
                onTap: () => {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (builder) => SignupPage()),
                          (route) => false)
                    },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            SizedBox(
              width: 10,
            ),
            Text(
              "SignUp",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ],
        ),
        backgroundColor: Colors.black26,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    fillColor: Colors.grey[210],
                    filled: true,
                    hintText: "Enter Your Mobile Number",
                    prefixText: "(+91)  ",
                    suffixIcon: InkWell(
                        onTap: () async => {
                              await auth.verifyPhoneNumber(
                                  "+91 ${phoneController.text}",
                                  context,
                                  setData)
                            },
                        child: Icon(Icons.send)),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 2.0,
                    ),
                  ),
                  Text(
                    "Enter 6 digit OTP",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 2.0,
                  ))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width - 34,
                fieldWidth: 58,
                otpFieldStyle: OtpFieldStyle(backgroundColor: Colors.white),
                style: TextStyle(fontSize: 20, color: Colors.black),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  setState(() {
                    smsCode = pin;
                  });
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Send OTP again in : ",
                      style: TextStyle(fontSize: 20, color: Colors.amber)),
                  TextSpan(
                      text: "00:$start",
                      style: TextStyle(fontSize: 20, color: Colors.red)),
                  TextSpan(
                      text: " sec",
                      style: TextStyle(fontSize: 20, color: Colors.amber))
                ]),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () => {
                  auth.signInWithPhoneNumber(verificationId, smsCode, context)
                },
                child: Text(
                  "Let's Go",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void setData(String verificationId) {
    setState(() {
      this.verificationId = verificationId;
    });
    startTimer();
  }
}
