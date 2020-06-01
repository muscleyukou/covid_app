

import 'package:covidapp/view/conponents/transition.dart';
import 'package:flutter/material.dart';

class LazyLoadText  extends StatelessWidget {
  final PageVisibility pageVisibility;
  final String text;


  LazyLoadText({this.pageVisibility,this.text});
  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme.title;
    return (
        Transform(transform: Matrix4.translationValues(pageVisibility.pagePosition*2500, pageVisibility.pagePosition*2000, 0),
          child: Text(
            text,
            style: textTheme.copyWith(fontWeight:FontWeight.bold,fontSize: 34.0,color: Colors.white),
            textAlign: TextAlign.center,
          ),)

    );
  }
}