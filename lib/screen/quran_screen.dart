import 'package:flutter/material.dart';
import 'package:qurankareem/constants/constant.dart';
import 'package:qurankareem/models/surah.dart';
import 'package:qurankareem/screen/jus_screen.dart';
import 'package:qurankareem/screen/surah_details.dart';
import 'package:qurankareem/services/api_service.dart';
import 'package:qurankareem/widgets/surah_custom_tile.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            backgroundColor:Constant.kSwatchColor,
            title: Text('Quran'),
            centerTitle: true,
            bottom: TabBar(tabs: [
              Text(
                'Surah',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              Text(
                'Sajda',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              Text(
                'Juz',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              )
            ]),
          ),
          body: TabBarView(
            children: [
              FutureBuilder(
                  future: apiServices.getSurah(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Surah>> snapshot) {
                    if (snapshot.hasData) {
                      List<Surah>? surah = snapshot.data;
                      return ListView.builder(
                        itemCount: surah!.length,
                        itemBuilder: (context, index) => SurahCustomListTile(
                            surah: surah[index],
                            context: context,
                            ontap: () {
                              setState(() {
                                Constant.surahIndex = (index + 1);
                              });
                              Navigator.pushNamed(context, Surahdetail.id);
                            }),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              Constant.juzIndex = (index + 1);
                            });
                            Navigator.pushNamed(context, JuzScreen.id);
                          },
                          child: Card(
                            elevation: 4,
                            color: Colors.blueGrey,
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        )));
  }
}
