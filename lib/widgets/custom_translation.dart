import 'package:flutter/material.dart';
import 'package:qurankareem/constants/constant.dart';
import 'package:qurankareem/models/translation.dart';

class TraranslationTile extends StatelessWidget {
  final int index;
  final SurahTraslation surahTraslation;
  const TraranslationTile({
    super.key,
    required this.index,
    required this.surahTraslation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              blurRadius: 1
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                Container(
                  width:double.infinity,
                  decoration: BoxDecoration(
                    color: Constant.KPrimary,
                    borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(8),
                      topRight: Radius.circular(8)
                       ),
                  ),
                  padding: EdgeInsets.all(16),
                
                ),
                Positioned(
                  top: 3,
                  left: 12,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black
                    )
                    ,alignment:Alignment.center,
                    child: Text(
                      surahTraslation.aya!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),
                      
                      ),
                    ),
                    
                  )
              ],
            )
            ,Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end
                ,children: [
                  Text(
                    surahTraslation.arabic_text!,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  )
                  ,Text(
                    surahTraslation.translation!,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                  )
                ],),
            )
        
        
        
          ],),
      ),
      );
  }
}
