import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        onTabChange: (value)=> onTabChange!(value),
        color:Colors.grey[400],
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade300,
        

        
        tabs: [
        
        GButton(icon: Icons.home,
        text:'shop',
        ),
        GButton(icon: Icons.shopping_bag_outlined,
        text: 'cart',)
      ]),
    );
  }
}
