import 'dart:ffi';

import 'package:flutter/material.dart';

class ListDesign {
  //String title="";
  Widget listTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        height: 60.0,
        width: 230.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.indigo[900],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 50.0,
              ),
              Icon(Icons.arrow_forward)
            ],
          ),
        ),
      ),
    );
  }

  Widget catdesign(String cat) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        height: 60.0,
        width: 230.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Text(
                  cat,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Icon(Icons.arrow_drop_down_circle_outlined)
          ],
        ),
      ),
    );
  }
}
