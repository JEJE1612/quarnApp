import 'package:flutter/material.dart';
import 'package:qurankareem/constants/constant.dart';
import 'package:qurankareem/models/translation.dart';
import 'package:qurankareem/services/api_service.dart';
import 'package:qurankareem/widgets/custom_translation.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

enum Translation { urdu,hindi,english,spanish}

class Surahdetail extends StatefulWidget {
  const Surahdetail({super.key});
  static const String id = 'surahDatail_screen';
  @override
  State<Surahdetail> createState() => _SurahdetailState();
}

class _SurahdetailState extends State<Surahdetail> {
  ApiServices _apiServices = ApiServices();
  SolidController _controller = SolidController();
  Translation? _translation = Translation.urdu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _apiServices.getTranslation(Constant.surahIndex!,_translation!.index),
          builder: (BuildContext context,
              AsyncSnapshot<SurahTranslationList> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.translationlist.length,
                itemBuilder: (context, index) {
                  return TraranslationTile(
                      index: index,
                      surahTraslation: snapshot.data!.translationlist[index]);
                },
              );
            } else {
              return Center(
                child: Text('Translation Not found'),
              );
            }
          }),
      bottomSheet: SolidBottomSheet(
          headerBar: Container(
            color: Theme.of(context).primaryColor,
            height: 50,
            child: Center(
              child: Text("Swips me !", style: TextStyle(color: Colors.white)),
            ),
          ),
          body: Container(
            color: Colors.white,
            height: 30,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Urdu"),
                      leading: Radio<Translation>(
                        value: Translation.urdu,
                        groupValue: _translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Hindi'),
                      leading: Radio<Translation>(
                        value: Translation.hindi,
                        groupValue: _translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('English'),
                      leading: Radio<Translation>(
                        value: Translation.english,
                        groupValue: _translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                      
                    )
                  ,  ListTile(
                      title: Text('Spanish'),
                      leading: Radio<Translation>(
                        value: Translation.spanish,
                        groupValue: _translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                      
                    )
                  
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
