import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qurankareem/constants/constant.dart';
import 'package:qurankareem/models/qari.dart';
import 'package:qurankareem/models/surah.dart';
import 'package:qurankareem/screen/audio_screen.dart';
import 'package:qurankareem/services/api_service.dart';

class AudioSurahScreen extends StatefulWidget {
  const AudioSurahScreen({super.key, required this.qari});
  final Qari qari;
  @override
  State<AudioSurahScreen> createState() => _AudioSurahScreenState();
}

class _AudioSurahScreenState extends State<AudioSurahScreen> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Surah List",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: apiServices.getSurah(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
              if (snapshot.hasData) {
                List<Surah> surah = snapshot.data!;
                return ListView.builder(
                    itemCount: surah.length,
                    itemBuilder: (context, index) => AudioTile(
                        surahName: snapshot.data![index].englishName,
                        totalAya: snapshot.data![index].numberOfAyahs,
                         number: snapshot.data![index].number!,
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AudioScreen(
                                      qari: widget.qari,
                                      index: index + 1,
                                      list: surah)));
                        }));
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}

Widget AudioTile(
    {required String? surahName,
    required totalAya,
    required int number,
    required VoidCallback ontap}) {
  return GestureDetector(
      onTap: ontap,
     child: Padding(
      padding: EdgeInsets.all(4.0)
    , child: Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 0,
            color: Colors.black12,
            offset: Offset(0,3)
          )
        ]
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 30,
            width: 40,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black
            ),
            child: Text((number).toString(),
            style: TextStyle(color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
            )),
            ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                surahName!,
              textAlign:TextAlign.end,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 3,),
              Text('Total Aya : $totalAya',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16
              ),
              
              )
            ],

          ),
          Spacer(),
          Icon(Icons.play_circle_fill,
          color: Constant.KPrimary,
          )

        ],),
    ), 
      
      
      ));
}
