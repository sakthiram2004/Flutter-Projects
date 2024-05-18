import 'package:coffee_shop/model/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee list

  final List<Coffee> _shop = [
    Coffee(
        name: 'Long Black',
        price: '4.10',
        image: 'coffee_shop/lib/images/Latte.png'),
    Coffee(
        name: 'Latte',
        price: '4.20',
        image: 'coffee_shop/lib/images/Latte.png'),
    Coffee(name: 'Espresso', price: '3.50', image: 'coffee_shop/lib/images'),
    Coffee(
        name: 'Ice Coffee',
        price: '4.10',
        image: 'coffee_shop/lib/images/Ice Coffee.PNG')
  ];

  // cart

  List<Coffee> _userCart = [];

  //gey coffee card

  List<Coffee> get coffeeshop => _shop;

  //get item of card

  List<Coffee> get coffeecard => _userCart;

  //add item card

  void addItems(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item card

  void removeCard(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
