import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:qurankareem/models/aya_of_the_day.dart';
import 'package:qurankareem/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void setData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("alreadyUsed", true);
  }

  ApiServices _apiServices = ApiServices();
  AyaOfTheDay? data;
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    var _hijri = HijriCalendar.now();
    HijriCalendar.setLocal("ar");
    var day = DateTime.now();
    var format = DateFormat('EEE , d MMM yyyy');
    var formatted = format.format(day);
    _apiServices.getAyaOftheDay().then((value) => data = value);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: _size.height * 0.22,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background_img.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatted,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  RichText(
                      text: TextSpan(children: <InlineSpan>[
                    WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            _hijri.hDay.toString(),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        style: const TextStyle(fontSize: 20)),
                    WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            _hijri.longMonthName,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '${_hijri.hYear} AH',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))
                  ])),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsetsDirectional.only(top: 10, bottom: 20),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32)),
                      child: Column(
                        children: [
                          FutureBuilder(
                              future: _apiServices.getAyaOftheDay(),
                              builder: (context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.none:
                                    return Icon(Icons.sync_problem);
                                  case ConnectionState.waiting:
                                  case ConnectionState.active:
                                    return CircularProgressIndicator();
                                  case ConnectionState.done:
                                    return Container(
                                      margin: EdgeInsetsDirectional.all(16),
                                      padding: EdgeInsetsDirectional.all(20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 3,
                                                spreadRadius: 1,
                                                offset: Offset(0, 1))
                                          ]),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Quran Aya of the Day',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Divider(
                                              color: Colors.black,
                                              thickness: 0.5),
                                          Text(
                                            snapshot.data!.arText!,
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            snapshot.data!.enTran!,
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16),
                                            textAlign: TextAlign.center,
                                          ),
                                          RichText(
                                              text: TextSpan(
                                                  children: <InlineSpan>[
                                                WidgetSpan(
                                                    child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    snapshot.data!.surEnName!
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                )),
                                                WidgetSpan(
                                                    child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    snapshot.data!.surEnName!,
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                ))
                                              ]))
                                        ],
                                      ),
                                    );
                                }
                              })
                        ],
                      ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
