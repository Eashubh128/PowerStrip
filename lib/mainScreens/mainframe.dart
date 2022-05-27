import 'package:flutter/material.dart';
import 'package:users_app/mainScreens/Wallet.dart';
import 'package:users_app/mainScreens/main_screen.dart';
import 'package:users_app/mainScreens/ourservices_screen.dart';
import 'package:users_app/mainScreens/profile_screen.dart';
import 'package:users_app/my_flutter_i_cons_icons.dart';

class Mynavbar extends StatefulWidget {
  const Mynavbar({Key? key}) : super(key: key);

  @override
  State<Mynavbar> createState() => _MynavbarState();
}

class _MynavbarState extends State<Mynavbar> {
  List<Widget> widgetitems = <Widget>[
    const OurServices(),
    MainScreen(),
    const WalletScreen(),
    ProfileScreen()
  ];
  int selectedindex = 1;

  void ontapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  List<BottomNavigationBarItem> navbaritems = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(
          Myicons.apps_filled,
          size: 35,
        ),
        label: "hello",
        backgroundColor: Colors.black),
    BottomNavigationBarItem(
        icon: Icon(
          Myicons.layer_3,
          size: 35,
        ),
        label: "hello",
        backgroundColor: Colors.black),
    BottomNavigationBarItem(
      icon: Icon(
        Myicons.credit_card_filled,
        size: 35,
      ),
      label: "hello",
      backgroundColor: Colors.black,
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Myicons.profile_filled,
          size: 35,
        ),
        label: "hello",
        backgroundColor: Colors.black),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetitems.elementAt(selectedindex),
      bottomNavigationBar: selectedindex == 0
          ? null
          : BottomNavigationBar(
              items: navbaritems,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.white,
              onTap: ontapped,
              currentIndex: selectedindex,
            ),
    );
  }
}
