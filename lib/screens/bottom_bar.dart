import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/screens/cart.dart';
import 'package:untitled1/screens/categories.dart';
import 'package:untitled1/screens/home_screen.dart';
import 'package:untitled1/screens/user.dart';

import '../provider/dark_theme_provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;

    final List<Map<String,dynamic>> _pages =[
      { "page" :const HomeScreen(), "title":"Home Screen" },
      { "page" :const Categories(), "title":"Categories" },
      { "page" :const CartScreen(), "title":"Cart Screen" },
      { "page" :const UserScreen(), "title":"User Screen" },
    ];

    void _selectedPage (int index){
      setState(() {
        _selectedIndex = index;
      });
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[_selectedIndex]["title"]),
      //   centerTitle: true,
      //   backgroundColor: isDark? Theme.of(context).cardColor:Colors.white10,
      //   titleTextStyle: TextStyle(color: isDark? Colors.blueAccent: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      //   titleSpacing: 2.0,
      // ),
      body: _pages[_selectedIndex]["page"],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        backgroundColor: isDark? Theme.of(context).cardColor: Colors.white70,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: isDark? Colors.blueAccent: Colors.black,
        unselectedItemColor: isDark? Colors.white60: Colors.blueGrey,


        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(_selectedIndex==0? Icons.home_outlined: Icons.home,),
          label: "Home",
        ),
        BottomNavigationBarItem(icon: Icon(_selectedIndex==1? Icons.class_outlined: Icons.class_,),
        label: "Category"),
        BottomNavigationBarItem(icon: Icon(_selectedIndex==2? Icons.shopping_bag_outlined: Icons.shopping_bag,),
        label: "Cart"),
        BottomNavigationBarItem(icon: Icon(_selectedIndex==3? Icons.person_outlined: Icons.person,),
        label: "Profile"),

      ],


        
      ),
    );
  }
}
