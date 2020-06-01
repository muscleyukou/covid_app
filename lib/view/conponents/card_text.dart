import 'package:covidapp/models/repository/model.dart';
import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  final VirusModel data;
  CardText({this.data});

  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 4.0,),
        Text('感染者数:${data.cases}人',style: textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal,fontSize: 25.0,color: Colors.white),),
        SizedBox(height: 2.0,),
        Text('死者数:${data.deaths}人',style: textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal,fontSize: 25.0,color:Colors.white),),
        SizedBox(height: 2.0,),
        Text('pcr人数:${data.pcr}人',style: textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal,fontSize: 25.0,color:Colors.white),),
      ],
    );
  }
}
