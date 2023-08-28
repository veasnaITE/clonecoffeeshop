import 'package:flutter/material.dart';
import 'coffee.dart';
class CoffeeShop extends ChangeNotifier{
  //coffee for sale list
  final List<Coffee> _shop=[
    //black cofee
    Coffee(
      name: "Long Black",
      price: "5.50",
      imagePath: "lib/images/latte.png",
    ),
    //latte
    Coffee(
      name: "Ice Latte",
      price: "6.00",
      imagePath: "lib/images/latte_iced.png",
    ),
    //espresso
    Coffee(
      name: "Espresso",
      price: "7.50",
      imagePath: "lib/images/expresso.png",
    ),
    //iced cofee
    Coffee(
      name: "Ice Coffee",
      price: "5.50",
      imagePath: "lib/images/coffee-cup.png",
    ),
  ];

  //user cart
  List<Coffee>_userCart=[];
  //get coffee list
  List<Coffee> get coffeeShop => _shop;
  //get user cart
  List<Coffee> get userCart => _userCart;
  //add items to cart
  void addItemToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }

}