
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snacofee/components/coffee_tile.dart';
import 'package:snacofee/models/coffee.dart';
import 'package:snacofee/models/coffee_shop.dart';
class ShopPage extends StatefulWidget {
  const ShopPage({super.key});
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //void coffee to cart
  void addToCart(Coffee coffee){
    Provider.of<CoffeeShop>(context,listen: false).addItemToCart(coffee);
    //let user know it add been successfully
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Successfully added to cart"),
        ),);
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context, value, child) =>
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children:[
                //header message
                const Text("How Would You Like Yours Coffee?",
                  style: TextStyle(fontSize: 20),),
                const SizedBox(height: 25,),
                //list of all coffee
                Expanded(
                  child: ListView.builder(
                    itemCount: value.coffeeShop.length,
                      itemBuilder: (context,index){
                    //get individual coffee
                    Coffee eacheCoffee = value.coffeeShop[index];
                    //return tile for this cofee
                    return CoffeeTile(
                      coffee: eacheCoffee,
                      icon: Icon(Icons.add),
                      onPressed: () => addToCart(eacheCoffee),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
