import 'package:flutter/material.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/pages/product_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  final List<Widget> pages = [const ProductList(), const CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentPage,
          children: pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
