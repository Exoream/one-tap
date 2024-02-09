import 'package:ecommerce/pages/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/pages/account/account_screen.dart';
import 'package:ecommerce/pages/content/home_content.dart';
import 'package:ecommerce/pages/drawer/drawer_screen.dart';
import 'package:ecommerce/pages/wishlist/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const WishlistScreen(),
    const ProductScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentTab == 0
          ? AppBar(
              title: const Text("OneTap", style: TextStyle(color: Colors.blue)),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {},
                ),
              ],
              iconTheme: const IconThemeData(color: Colors.blue),
            )
          : null,
      drawer: _currentTab == 0 ? const DrawerScreen() : null,
      body: _screens[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (index) {
          setState(() {
            _currentTab = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blue),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.blue),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_mall, color: Colors.blue),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.blue),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
