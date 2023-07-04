import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../widgets/text_widget.dart';
// import '../widgets/list_tile_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");
  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;
    final Color color = isDark ? Colors.blueAccent : Colors.black;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        children: [
          RichText(
            text: TextSpan(
                text: "Welcome  ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.amberAccent : Colors.green,
                  fontSize: 24,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    //      TODO
                  },
                children: <TextSpan>[
                  TextSpan(
                    text: "Elijah",
                    style: TextStyle(
                        color: color,
                        fontSize: 24,
                        fontWeight: FontWeight.w200),
                  )
                ]),
          ),
          TextWidget(
              text: "elijahfrimpong@gmail.com", color: color, textSize: 18),
          const SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 2,
            color: color,
          ),
          const SizedBox(
            height: 5,
          ),
          listTileBuilder(
              title: "Address",
              icon: FontAwesomeIcons.addressBook,
              subTitle: "My Home",
              color: color,
              onPressed: () async {
                _showAddressDialog();
              }),
          listTileBuilder(
              title: "Orders",
              icon: FontAwesomeIcons.personRunning,
              color: color,
              onPressed: () {}),
          listTileBuilder(
              title: "WishList",
              icon: FontAwesomeIcons.bagShopping,
              color: color,
              onPressed: () {}),
          listTileBuilder(
              title: "Viewed",
              icon: FontAwesomeIcons.eye,
              color: color,
              onPressed: () {}),
          listTileBuilder(
              title: "Forget Password",
              icon: FontAwesomeIcons.lock,
              color: color,
              onPressed: () {}),
          SwitchListTile(
            title: TextWidget(
              text: isDark ? "Dark mode" : "Light Mode",
              color: color,
              textSize: 20,
            ),
            secondary: Icon(themeState.getDarkTheme
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onChanged: (bool value) {
              setState(() {
                themeState.setDarkTheme = value;
              });
            },
            value: themeState.getDarkTheme,
          ),
          listTileBuilder(
              title: "Logout",
              icon: FontAwesomeIcons.signOut,
              color: color,
              onPressed: () async {
                await _showLogoutDialog();
              }),
        ],
      ),
    );
  }

  Future<void> _showAddressDialog() async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Update Address"),
            content: TextField(
              onChanged: (value) {
                _addressTextController.text;
              },
              controller: _addressTextController,
              maxLines: 5,
              decoration: const InputDecoration(hintText: "Your Address"),
            ),
            actions: [
              TextButton(onPressed: () {}, child: const Text("UPDATE"))
            ],
          );
        });
  }

  Future<void> _showLogoutDialog() async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/warning-sign.png',
                  width: 20,
                  height: 20,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text("Logout"),
              ],
            ),
            content: const Text("Are you sure you want to Logout?"),
            actions: [
              TextButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("CANCEL")),
              TextButton(onPressed: () {}, child: const Text("SURE"))
            ],
          );
        });
  }

  Widget listTileBuilder({
    required String title,
    required IconData icon,
    String? subTitle,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 20,
      ),
      leading: Icon(icon),
      trailing: const Icon(Icons.chevron_right),
      subtitle: TextWidget(
        text: subTitle ?? "",
        color: color,
        textSize: 14,
      ),
      onTap: () {
        onPressed();
      },
    );
  }
}
