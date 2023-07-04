import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/widgets/text_widget.dart';

import '../provider/dark_theme_provider.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget(
      {Key? key,
      required this.catName,
      required this.imgPath,
      required this.catColor})
      : super(key: key);
  final String catName, imgPath;
  final Color catColor;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);
    final color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: catColor.withOpacity(0.1),
          border: Border.all(
              width: 2, style: BorderStyle.solid, color: catColor.withOpacity(0.7)),
        ),
        child: Column(
          children: [
            Container(
              width: _screenWidth * 0.3,
              height: _screenWidth * 0.3,
              decoration: (BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.fill,
              ))),
            ),
            TextWidget(
              text: catName,
              color: color,
              textSize: 20,
              isTitle: true,
            )
          ],
        ),
      ),
    );
  }
}
