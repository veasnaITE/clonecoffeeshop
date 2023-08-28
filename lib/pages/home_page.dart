import 'package:flutter/material.dart';
import 'package:snacofee/components/bottom_nav_bar.dart';
import 'package:snacofee/pages/shop_page.dart';

import '../const.dart';
import 'cart_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //navigate bottom bar
  int _selectedIndex=0;
  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex= index;
    });
  }
  //pages
  final List<Widget> _pages=[
    //shop page
    ShopPage(),
    //cart Page
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) =>navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
