import 'package:flutter/material.dart';
import 'package:millenium/pages/cart_page.dart';
import 'package:millenium/pages/home_page.dart';
import 'package:millenium/pages/profile_page.dart';
import 'package:millenium/pages/search_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState()=> _HomeState();

}

class _HomeState extends State<Home>{
  int _selectedIndex=0;


  final _pages = [
    const HomePage(),
    const SearchPage(),
    const CartPage(),
    const ProfilePage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: const Color.fromARGB(255, 240, 240, 240),
  
  body: _pages[
    _selectedIndex
  ],

  bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex, 
        onTap: (index){
          setState(() {
            _selectedIndex=index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Поиск'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket),label: 'Корзина'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:'Профиль'),
        ],
      ),
      );
  }
}