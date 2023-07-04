import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/provider/dark_theme_provider.dart';
import 'package:untitled1/services/utils.dart';
import 'package:untitled1/widgets/text_widget.dart';

import '../widgets/on_sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List _carouselImage = [
      "assets/images/landing/buy-on-laptop.jpg",
      "assets/images/landing/buy-through.png",
      "assets/images/landing/buyfood.jpg",
      "assets/images/landing/store.jpg",
      "assets/images/landing/grocery-cart.jpg",
      "assets/images/landing/vergtablebg.jpg",
    ];
    Utils utils = Utils(context);
    final double _screenHeight = utils.getScreenSize.height;

    final bool themeState = utils.getTheme;
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: _screenHeight * 0.33,
          child: Swiper(
            autoplay: false,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                _carouselImage[index],
                fit: BoxFit.fill,
              );
            },
            itemCount: _carouselImage.length,
            pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                    color: Colors.white, activeColor: Colors.blueAccent)),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        TextButton(
          onPressed: () {},
          child: TextWidget(
            text: 'View all',
            color: Colors.orange,
            textSize: 18,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          children: [
            RotatedBox(
              quarterTurns: -1,
              child: Row(
                children: [
                  TextWidget(
                    text: "On sale".toUpperCase(),
                    color: Colors.red,
                    textSize: 22,
                    isTitle: true,
                  ),
                  SizedBox( width: 5,),
                  // FaIcon(FontAwesomeIcons.productHunt, color: Colors.red,)
                  Icon(FontAwesomeIcons.gift, color: Colors.red, size: 22,)
                ],
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Flexible(
              child: SizedBox(
                height: _screenHeight * 0.31,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const OnSaleWidget();
                    }),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
