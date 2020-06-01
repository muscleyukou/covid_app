import 'package:covidapp/view/conponents/datasorce.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[200],
        centerTitle: true,
        title: Text(
          'FAQs',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: DataSourse.questionAnswers.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              backgroundColor: Colors.yellow[100],
              title: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Text(
                    DataSourse.questionAnswers[index]['question'],
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0),
                  ),
                ),
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Text(
                      DataSourse.questionAnswers[index]['answer'],
                      style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.normal,
                          fontSize: 13.0),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
