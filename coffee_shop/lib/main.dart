import 'package:coffee_shop/model/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/home.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( create: (context)=>CoffeeShop(),
    builder: (context,child)=>const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    ),
      
    );
  }
}
