import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:qurankareem/constants/constant.dart';
import 'package:qurankareem/screen/Mainpage.dart';
import 'package:qurankareem/screen/SplachScreen.dart';
import 'package:qurankareem/screen/jus_screen.dart';
import 'package:qurankareem/screen/login_screen.dart';
import 'package:qurankareem/screen/register.dart';
import 'package:qurankareem/screen/surah_details.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCZHyVNraLXbDd99dTPId5jX8PYjitTD84", 
      appId:  "1:1090269268183:android:5fd5b86eb09abd82f4c892",
      messagingSenderId: "1090269268183",
      projectId: "mislumsoul")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Muslim Soul',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Constant.kSwatchColor,
          primaryColor: Constant.KPrimary,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Poppins'),
      home:  SplashScreen(),
      routes: {
        JuzScreen.id: (context) => JuzScreen(),
        Surahdetail.id: (context) => Surahdetail()
      },
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/main', page: () => MainScreen()),
      ],
    );
  }
}
