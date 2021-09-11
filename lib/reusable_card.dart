import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.cardChild});

  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(25.0),
      elevation: 20,
      child: Container(
        child: cardChild,
        //margin: EdgeInsets.all(15.0),
        width: 370,
        height: 190,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0), color: Colors.white),
      ),
    );
  }
}
