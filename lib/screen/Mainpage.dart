import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:qurankareem/constants/constant.dart';
import 'package:qurankareem/screen/HomeScreen.dart';
import 'package:qurankareem/screen/prayer_screen.dart';
import 'package:qurankareem/screen/qari_screen.dart';
import 'package:qurankareem/screen/quran_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectindex = 0;
   List<Widget> _widgetsList = [
    HomeScreen(),
    QuranScreen(),
    QarListiScreen(),
    PrayerScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: _widgetsList[selectindex],  
      bottomNavigationBar: ConvexAppBar(
        items:  [
          TabItem(icon: Image.asset('assets/home.png', color: Colors.white,), title: 'Home'),
          TabItem(icon: Image.asset('assets/holyQuran.png',color: Colors.white,), title: 'Quran'),
          TabItem(icon: Image.asset('assets/audio.png',color: Colors.white,), title: 'Audio'),
          TabItem(icon: Image.asset('assets/mosque.png', color: Colors.white,), title: 'Prayer')
        ],
        initialActiveIndex: 0,
        onTap: updateIndex,
        backgroundColor: Constant.KPrimary,
        activeColor: Constant.KPrimary,
      ),
    ));
  }

  void updateIndex(index) {
    setState(() {
      selectindex = index;
    });
  }
}
