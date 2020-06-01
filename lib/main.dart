
import 'package:covidapp/models/db/db.dart';
import 'package:covidapp/view/screens/home_screen.dart';
import 'package:covidapp/view/style/font.dart';
import 'package:covidapp/viewmodel/news_view_model.dart';
import 'package:covidapp/viewmodel/virus_view_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
NewsDatabase newsDatabase;

void main() {
  newsDatabase=NewsDatabase();

  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create:(context)=>VirusViewModel(),),
        ChangeNotifierProvider(create: (context)=>NewsViewModel(),),
      ],
        child: MyApp(),)
  );

}

class MyApp extends StatelessWidget {
  final virusApp = 'virusApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: virusApp,
      home: HomeScreen(),
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: Regular,
      ),
    );
  }
}

