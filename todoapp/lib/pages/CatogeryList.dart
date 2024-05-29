import 'package:flutter/material.dart';

class Todocarditem extends StatefulWidget {
  const Todocarditem({super.key, required this.title, required this.time});

  final String title;
  final String time;

  @override
  State<Todocarditem> createState() => _TodocarditemState();
}

class _TodocarditemState extends State<Todocarditem> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Theme(
                data: ThemeData(
                  unselectedWidgetColor: Colors.white,
                ),
                child: Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              Container(
                color: Colors.grey[800],
                width: 300,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        widget.time,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
