import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagepath;
  const SquareTile({super.key, required this.imagepath});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15)),
      child: Image.asset(
        imagepath,
        height: 40,
      ),
    );
  }
}
