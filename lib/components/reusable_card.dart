import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget iconContent;

  ReusableCard({@required this.colour, this.iconContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: iconContent,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
