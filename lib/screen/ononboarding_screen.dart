import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:qurankareem/constants/constant.dart';
import 'package:qurankareem/screen/Mainpage.dart';

class OnBroardingScreen extends StatefulWidget {
  const OnBroardingScreen({super.key});

  @override
  State<OnBroardingScreen> createState() => _OnBroardingScreenState();
}

class _OnBroardingScreenState extends State<OnBroardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         backgroundColor: Colors.white,
          body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Read Quran" ,
            bodyWidget: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0)
                ,  child: Text(
                  "Customize your reading view , read in multiple language , Listen diffrenet audio "
              ,  textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16
              ),   
                ) ,
                  )

                ],
            ) ,
           image:Center(child: Image.asset('assets/quran.png',
           fit: BoxFit.fill,
           ),
           )
          )
        , 
          PageViewModel(
            title: "Prayer Alerts" ,
            bodyWidget: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0)
                ,  child: Text(
                  "Choose your adhan , which prayer to notified of and how often ."
              ,  textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16
              ),   
                ) ,
                  )

                ],
            ) ,
           image:Center(child: Image.asset('assets/prayer.png',
           fit: BoxFit.fill,
           ),
           )
          ),
          
          PageViewModel(
            title: "Build Better Habits" ,
            bodyWidget:const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Padding(
                  padding: EdgeInsets.all(8.0)
                ,  child: Text(
                  "Make Islamic practics a part of your daily life in a way the best Suits Your life "
              ,  textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16
              ),   
                ) ,
                  )

                ],
            ) ,
           image:Center(child: Image.asset('assets/zakat.png',
           fit: BoxFit.fill,
           ),
           )
          )
        
        ],
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context)=> const MainScreen())
          );
        },
        showSkipButton: false,
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        done: const Text(
          "Done",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            color: Constant.KPrimary,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      )),
    );
  }
}
