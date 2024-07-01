import 'package:flutter/material.dart';
import 'package:qurankareem/constants/constant.dart';
import 'package:qurankareem/models/qari.dart';
import 'package:qurankareem/screen/AudioSurahScreen.dart';
import 'package:qurankareem/services/api_service.dart';
import 'package:qurankareem/widgets/qari_screen.dart';

class QarListiScreen extends StatefulWidget {
  const QarListiScreen({super.key});

  @override
  State<QarListiScreen> createState() => _QarListiScreenState();
}

class _QarListiScreenState extends State<QarListiScreen> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
            backgroundColor:Constant.kSwatchColor,
        title: Text("Qari\'s"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 1,
                        spreadRadius: 0.0,
                        offset: Offset(0, 1))
                  ]),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [Text('Search'), Spacer(), Icon(Icons.search)],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: FutureBuilder(
                    future: apiServices.getQariList(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Qari>> snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Qari\'s data not found'),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return QariCustomTile(
                                qari: snapshot.data![index],
                                onTap: () {
                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(
                                      builder:(context)=>AudioSurahScreen(
                                        qari:snapshot.data![index]
                                      ) ) 
                                  );
                                });
                          });
                    }))
          ],
        ),
      ),
    ));
  }
}
