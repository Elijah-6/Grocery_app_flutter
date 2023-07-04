import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/services/utils.dart';
import 'package:untitled1/widgets/text_widget.dart';

import '../widgets/categories_widget.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List _catColors = [
      Colors.green[300],
      Colors.orange[200],
      Colors.red[100],
      Colors.blue[100],
      Colors.indigo[100],
      Colors.teal[300],
    ];

    final List<Map<String, dynamic>> _catItems = [
      {"catName": "Vegetables", "catImg": "assets/images/cat/veg.png"},
      {"catName": "Fruits", "catImg": "assets/images/cat/fruits.png"},
      {"catName": "Spices", "catImg": "assets/images/cat/spices.png"},
      {"catName": "Spinach", "catImg": "assets/images/cat/Spinach.png"},
      {"catName": "Grains", "catImg": "assets/images/cat/grains.png"},
      {"catName": "Nuts", "catImg": "assets/images/cat/nuts.png"},
    ];

    final utils = Utils(context);
    final Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
            text: 'Categories', color: color, textSize: 20, isTitle: true),
      ),
      body: GridView.count(
        padding:EdgeInsets.symmetric(horizontal: 10),
        crossAxisCount: 2,
        childAspectRatio: 250/ 250,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(
            6,
            (index) => CategoryWidget(
                  catName: _catItems[index]["catName"],
                  imgPath: _catItems[index]["catImg"],
                  catColor: _catColors[index],
                )),
      ),
    );
  }
}
