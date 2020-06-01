import 'package:covidapp/view/pages/about_us.dart';
import 'package:covidapp/view/pages/faq.dart';
import 'package:covidapp/view/pages/head_line.dart';
import 'package:covidapp/view/pages/virus_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currerntIndex = 0;
  final _page = [
    HeadLinePage(),
    VirusData(),
    FaqPage(),
    AboutUsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
      selectedItemColor:Colors.deepOrange,
        unselectedItemColor: Colors.deepOrangeAccent[100],
        backgroundColor: Colors.deepOrangeAccent[100],
        items: const [
          BottomNavigationBarItem(
              icon: const Icon(Icons.highlight), title: Text('ニュース一覧'),),
          BottomNavigationBarItem(
              icon: const Icon(Icons.data_usage), title: Text('県別コロナ情報')),
          BottomNavigationBarItem(
              icon: const Icon(Icons.question_answer), title: Text('FAQ')),
          BottomNavigationBarItem(
              icon: const Icon(Icons.info), title: Text('About us')),

        ],
        currentIndex: _currerntIndex,
        onTap: (index) {
          setState(() {
            _currerntIndex = index;
          });
        },
      ),
      body: _page[_currerntIndex],
    );
  }
}
