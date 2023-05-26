import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/screen/favorite/favorite_screen.dart';
import 'package:weatherapp/screen/home/home_screen.dart';
import 'package:weatherapp/utils/constants.dart';

class BottomBar extends StatefulWidget {
  final int selectedIndex;
  const BottomBar({
    Key? key,
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const HomeScreen(),
      const FavoriteScreen(),
    ];
    final bottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home), label: "Home"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.favorite), label: "Favourite"),
    ];

    assert(pages.length == bottomNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: bottomNavBarItems,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      currentIndex: _currentTabIndex,
      selectedItemColor: ConstantUtils.primaryColor,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
