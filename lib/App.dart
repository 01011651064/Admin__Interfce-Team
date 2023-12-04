import 'package:admin_interface/DeliveryMenPage.dart';
import 'package:admin_interface/EditMenuPage.dart';
import 'package:admin_interface/OverviewPage.dart';
// import 'package:admin_interface/Overview_page.dart';
import 'package:admin_interface/StockPage.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            OverviewPage(),
            EditMenuPage(),
            DeliveryMenPage(),
            StockPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.black,

          iconSize: 35,
          selectedFontSize: 20,

          // backgroundColor: Colors.orange,

          selectedItemColor: Colors.blue,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit, color: Colors.black),
              label: 'Edit Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining, color: Colors.black),
              label: 'Delivery Men',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory, color: Colors.black),
              label: 'Stock',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
