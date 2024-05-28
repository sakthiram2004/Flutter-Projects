import 'package:flutter/material.dart';

class AddToDoPageState extends StatefulWidget {
  const AddToDoPageState({super.key});

  @override
  State<AddToDoPageState> createState() => _AddToDoPageStateState();
}

class _AddToDoPageStateState extends State<AddToDoPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff1d1e26),
          Color(0xff252041),
        ])),
      ),
    );
  }
}
