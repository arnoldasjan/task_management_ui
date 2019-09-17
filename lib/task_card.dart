import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {

  final String number;
  final String item;
  final Color backgrClr;
  final Color firstCircle;
  final Color secondCircle;

  TaskCard({this.number, this.item, this.backgrClr, this.firstCircle, this.secondCircle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                color: backgrClr,
              ),
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: firstCircle,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60.0)),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: secondCircle,
                  borderRadius:
                  BorderRadius.only(topRight: Radius.circular(60.0)),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 100.0,
          width: 230.0,
          decoration: BoxDecoration(
            color: Color(0xFFffe5b4),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                number,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color(0xFF00003f),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                item,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFF00003f),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}