import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: UserAccountsDrawerHeader(
        accountName: Text("Elijah"),
        accountEmail: Text("efrempong@gmail.com",),
              currentAccountPicture: CircleAvatar(radius:50, backgroundColor: Colors.tealAccent,),
      )),
    );
  }
}
