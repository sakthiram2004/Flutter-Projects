import 'package:flutter/material.dart';
import 'package:todoapp/pages/signup.dart';
import 'package:todoapp/service/AuthService.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  AuthClass authClass = AuthClass();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () => {
            authClass.logout(),
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (builder) => SignupPage()),
                (route) => false)
          },
          child: Icon(Icons.logout),
        ),
      ),
    );
  }
}
