import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snacofee/components/coffee_tile.dart';
import 'package:snacofee/models/coffee.dart';
import 'package:snacofee/models/coffee_shop.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    //remove item from cart
    void removeItemFromCart(Coffee coffee){
      Provider.of<CoffeeShop>(context,listen: false).removeItemFromCart(coffee);
    }
    //pay now button tapped
    void payNow(){

    }
    return Consumer<CoffeeShop>(builder: (context, value, child) =>
        SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Text("Your Cart",style:TextStyle(fontSize: 20) ,
                  ),
                  //list of cart item
                  Expanded(
                      child: ListView.builder(
                        itemCount: value.userCart.length,
                          itemBuilder: (context,index){
                        //get idividual cart items
                        Coffee eachCoffee = value.userCart[index];
                        //return cofeetile
                        return CoffeeTile(
                          coffee: eachCoffee,
                          icon: Icon(Icons.minimize),
                          onPressed: () => removeItemFromCart(eachCoffee),
                          );
                      },
                      ),
                  ),
                  //pay button
                  GestureDetector(
                    onTap: payNow,
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          color: Colors.brown,
                      borderRadius: BorderRadius.circular(12)),
                      child: const Text(
                        "Pay Now",style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )),);
  }
}
