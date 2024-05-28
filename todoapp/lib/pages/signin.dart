import 'package:flutter/material.dart';
import 'package:todoapp/components/My_textfield.dart';
import 'package:todoapp/images/square.dart';
import 'package:todoapp/pages/Home.dart';
import 'package:todoapp/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:todoapp/service/AuthService.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthClass authClass = AuthClass();
    firebase_auth.FirebaseAuth auth = firebase_auth.FirebaseAuth.instance;
    late firebase_auth.UserCredential userCredential;
    TextEditingController usercontroller = TextEditingController();
    TextEditingController passControoller = TextEditingController();

    void signin() async {
      try {
        userCredential = await auth.signInWithEmailAndPassword(
            email: usercontroller.text, password: passControoller.text);

        print(userCredential.user?.email);
        print("========================");

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (builder) => HomePage()),
            (route) => false);
      } catch (e) {
        final SnackBar snackBar = SnackBar(content: Text(e.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Icon(
              Icons.login_outlined,
              size: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Sign In",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: usercontroller,
                hintText: "Username",
                obscureText: false),
            MyTextField(
                controller: passControoller,
                hintText: "Password",
                obscureText: true),
            Padding(
              padding: const EdgeInsets.only(right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text("Forgot Password")],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => {signin()},
              child: Text(
                'Sign In',
                style: TextStyle(fontSize: 20.0),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
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
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () async => {await authClass.googleSignin(context)},
                    child: SquareTile(imagepath: 'lib/images/google.png')),
                SizedBox(
                  width: 20,
                ),
                // SquareTile(
                //   imagepath: 'lib/images/phone.png',
                // )
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Row(
                children: [
                  Text("Create Account :"),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => SignupPage()),
                            (route) => false);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
