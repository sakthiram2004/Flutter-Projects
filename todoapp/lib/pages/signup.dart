import 'package:flutter/material.dart';
import 'package:todoapp/components/My_textfield.dart';
import 'package:todoapp/images/square.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:todoapp/pages/AuthwithMobile.dart';

import 'package:todoapp/pages/signin.dart';
import 'package:todoapp/service/AuthService.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  AuthClass authClass = AuthClass();
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  late firebase_auth.UserCredential usercredential;
  firebase_auth.FirebaseAuth auth = firebase_auth.FirebaseAuth.instance;

  Widget build(BuildContext context) {
    void signup() async {
      try {
        usercredential = await auth.createUserWithEmailAndPassword(
            email: usernamecontroller.text, password: passwordcontroller.text);
        print(usercredential.user?.email);
        print('--------------------------');

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (builder) => SignInPage()),
            (route) => false);
      } catch (e) {
        final snackbar = SnackBar(content: Text(e.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Icon(
              Icons.lock,
              size: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Sign up",
              style: TextStyle(
                fontSize: 40.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: usernamecontroller,
              hintText: "Username",
              obscureText: false,
            ),
            MyTextField(
              controller: passwordcontroller,
              hintText: "Create Password",
              obscureText: true,
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () => {signup()},
              child: Text(
                'Sign up',
                style: TextStyle(fontSize: 20.0),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[200],
                  ),
                ),
                Text("Or Continue With"),
                Expanded(
                  child: Divider(
                    color: Colors.grey[200],
                    thickness: 0.5,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () async => {await authClass.googleSignin(context)},
                    child: SquareTile(imagepath: 'lib/images/google.png')),
                SizedBox(
                  width: 30,
                ),
                // InkWell(
                //     onTap: () => {
                //           Navigator.pushAndRemoveUntil(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (builder) => MobileAuth()),
                //               (route) => false)
                //         },
                //     child: SquareTile(imagepath: 'lib/images/phone.png'))
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Row(
                children: [
                  Text("I have Account :"),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => SignInPage()),
                            (route) => false);
                      },
                      child: Text("Sign In"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
