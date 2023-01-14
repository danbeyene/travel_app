import 'package:flutter/material.dart';
import 'package:travel_app/pages/nav_pages/account_page.dart';
import 'package:travel_app/pages/nav_pages/analytics_page.dart';
import 'package:travel_app/pages/nav_pages/home_page.dart';
import 'package:travel_app/pages/nav_pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages=[
    HomePage(),
    AnalyticsPage(),
    SearchPage(),
    AccountPage()
  ];
  int currentIndex=0;
   void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label: 'Analytics', icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: 'Account', icon: Icon(Icons.person))
        ],
      ),
    );
  }
}
