import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/services/utils.dart';
import 'package:untitled1/widgets/price_widget.dart';
import 'package:untitled1/widgets/text_widget.dart';

class OnSaleWidget extends StatelessWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/cat/fruits.png",
                    height: size.height * 0.22,
                    width: size.width * 0.22,
                  ),
                  const PriceWidget(),
                  Text(
                    "Get your freshness",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              Column(
                children: [
                  TextWidget(text: "1KG", color: color, textSize: 20),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){},
                          child: const FaIcon(FontAwesomeIcons.bagShopping)),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: (){
                          // print("Heart");
                        },
                          child: const FaIcon(FontAwesomeIcons.heart))
                    ],
                  )
                  // RichText(
                  //   text: TextSpan(
                  //       text: "1KG", style: TextStyle(color: Colors.red)),
                  //   //  Text(
                  //   //   "Hello",
                  //   //   style: TextStyle(
                  //   //       color: Colors.cyan,
                  //   //       fontWeight: FontWeight.bold,
                  //   //       fontStyle: FontStyle.italic, letterSpacing: 2,),
                  //   // ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
