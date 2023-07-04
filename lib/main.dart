import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/provider/dark_theme_provider.dart';
import 'package:untitled1/screens/bottom_bar.dart';
import './consts/theme.dart';
import './screens/home_screen.dart';

void main() {

  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      // .then((_) {
    runApp( MyApp(),);
  // });
}

class MyApp extends StatefulWidget {

  MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentTheme() async{
    themeChangeProvider.setDarkTheme= await themeChangeProvider.darkThemePrefs.getTheme();

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create:(_)=>themeChangeProvider)],
      child: Consumer <DarkThemeProvider>(
        builder: (context, themeProvider, child) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Style.themeData(themeProvider.getDarkTheme, context),
            home: BottomBarScreen(),
          );
        }
      ),
    );
  }
}


