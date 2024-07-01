import 'package:flutter/material.dart';
import 'package:qurankareem/models/qari.dart';
import 'package:qurankareem/services/api_service.dart';

class QariCustomTile extends StatefulWidget {
  const QariCustomTile({super.key, required this.qari, required this.onTap});
  final Qari qari;
  final VoidCallback onTap;
  @override
  State<QariCustomTile> createState() => _QariCustomTileState();
}

class _QariCustomTileState extends State<QariCustomTile> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Container(
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: 0,
                color: Colors.black12,
                offset: Offset(0, 1)
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.qari.name!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ), 
        
        ),
    );
  }
}
