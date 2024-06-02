import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  String imagelogo = "";
  String category = "";

  CategoryList(String imagelogo, String category) {
    this.category = category;
    this.imagelogo = imagelogo;
  }
  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(widget.imagelogo),
          radius: 40.0,
        ),
        Text(
          widget.category,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
