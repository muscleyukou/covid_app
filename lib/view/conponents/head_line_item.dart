
import 'package:covidapp/models/models/virus_model.dart';
import 'package:covidapp/view/conponents/lazy_load_text.dart';
import 'package:covidapp/view/conponents/transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'image_from_url.dart';
class HeadLineItem extends StatelessWidget {
  final Article article;
  final ValueChanged onArticledTap;
  final PageVisibility pageVisibility;

  HeadLineItem({this.article,this.onArticledTap,this.pageVisibility});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: InkWell(
        onTap: ()=>onArticledTap(article),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.deepOrange[300],
                    Colors.black12,
                  ] ,
                ),
              ),
              child: ImageFromUrl(
                imageUrl: article.urlToImage,
              ),),
            Positioned(
              left: 32.0,
              right: 32.0,
              bottom:32.0,
              child: LazyLoadText(
                text: article.title,
                pageVisibility: pageVisibility,
              ),
            ),
          ],
        ),
      ),
    );
  }
}