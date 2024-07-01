import 'package:flutter/material.dart';
import 'package:qurankareem/constants/constant.dart';
import 'package:qurankareem/models/juz.dart';
import 'package:qurankareem/services/api_service.dart';
import 'package:qurankareem/widgets/juz_costum_tile.dart';

class JuzScreen extends StatelessWidget {
  static const String id = 'juz_screen';
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder<JuzModel>(
        future: apiServices.getJuzz(Constant.juzIndex!),
        builder: (context, AsyncSnapshot<JuzModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            print('${snapshot.data!.juzAyahs.length} length');
            return ListView.builder(
              itemBuilder: (context, index) {
                return JuzCostumTile(
                    list: snapshot.data!.juzAyahs, index: index);
              },
              itemCount: snapshot.data!.juzAyahs.length,
            );
          } else {
            return Center(
              child: Text('Data not found'),
            );
          }
        },
      ),
    ));
    
  }
}
