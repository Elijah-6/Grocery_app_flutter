
import 'package:flutter/material.dart';
import 'package:untitled1/widgets/text_widget.dart';

import '../services/utils.dart';


class PriceWidget extends StatelessWidget {
  const PriceWidget ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Utils utils = Utils(context);
    // final double _screenHeight = utils.getScreenSize.height;
    final color = utils.color;
    return FittedBox(
    child: Row(
    children: [
      TextWidget(text: "\$99", color: color, textSize: 20),
      SizedBox(width: 6,),
      Text("\$102")
],
    ),
    );
  }
}
