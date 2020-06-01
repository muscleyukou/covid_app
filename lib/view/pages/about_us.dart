import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  var _index=0;
  TextStyle get _textstyle{
    switch(_index%4){
      case 0:
        return Theme.of(context).textTheme.display1.copyWith(color: Colors.red,fontSize: 10.0);
      case 1:
        return Theme.of(context).textTheme.display1.copyWith(color: Colors.green,fontSize: 120.0);
      case 2:
        return Theme.of(context).textTheme.display1.copyWith(color: Colors.lightBlueAccent,fontSize: 30.0);
      case 3:
        return Theme.of(context).textTheme.display1.copyWith(color: Colors.deepPurple,fontSize: 80.0);
    }
    assert(false);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           setState(() {
             _index++;
           });
          },
          backgroundColor: Colors.deepOrange,
          child: const Icon(Icons.refresh),
        ),
        body: Center(
          child: AnimatedDefaultTextStyle(
            style: _textstyle,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: Text('密です'),
            ),
        ),

        );
  }
}
