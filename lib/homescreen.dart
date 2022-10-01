import 'package:egyptnews/myScreens/businessScreen.dart';
import 'package:egyptnews/string/string.dart';
import 'package:egyptnews/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'model/articles.dart';
import 'myScreens/scienceScreeen.dart';
import 'myScreens/sportsScreeen.dart';
import 'myScreens/widget/changeThemeButtonWidget.dart';
import 'network/network_request.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///bool valuemode = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ThemeProvider>(
        builder: (context, prov, child) => Scaffold(
          drawerEnableOpenDragGesture: false,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              title[prov.CurrentIndex],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                     const SizedBox(
                      height: 5,
                    ),
                     const Expanded(flex: 1, child: Text('changeTheme')),
                     const Expanded(flex: 2, child: ChangeTheameButtonWidget()),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: prov.CurrentIndex,
            onTap: (index) {
              Provider.of<ThemeProvider>(context, listen: false)
                  .ChangeCurrentIndex(index);
            },
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.business_center, size: 30),
                  label: 'business'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.sports_tennis, size: 30), label: 'sports'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.science, size: 30), label: 'science'),
            ],
            //letIndexChange: (index) => true,
          ),
          drawer: Drawer(
              child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const UserAccountsDrawerHeader(
                  accountName: Text("AbdoAmer"),
                  accountEmail: Text("abdoamer067@gmail.com")),
            ],
          )),
          body: widgetpages[prov.CurrentIndex],
        ),
      ),
    );
  }
}
