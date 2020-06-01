import 'package:flutter/material.dart';
class PressButton extends StatelessWidget {
  final VoidCallback function ;
  final IconData icon;
  PressButton({this.function,this.icon});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: function,
      tooltip: '更新',
      child: Icon(icon),
      backgroundColor: Colors.deepOrange,
    );
  }
}
