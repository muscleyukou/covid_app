
import 'package:covidapp/models/repository/model.dart';
import 'package:covidapp/view/conponents/card_text.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class VirusList extends StatelessWidget {
  final VirusModel data;
  VirusList({this.data});
  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return SafeArea(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
        elevation: 8.0,
       color: Colors.orangeAccent[100],
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,top: 8.0,bottom: 8.0,right: 8.0),
          child: Row(
            children: <Widget>[
              Expanded(flex: 1,
                child:Text('${data.name_ja}',style: textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold,fontSize: 25.0,color: Colors.deepOrange[400]),),
              ),
              Expanded(
                flex: 2,
                child:Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: CardText(
                    data: data,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }






}


