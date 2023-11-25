import 'package:flutter/material.dart';

class AppCustomText extends StatelessWidget {
  String text;
  double size;
  int lines;
  FontWeight fontWeight;
  Color color;
  double height;
  AppCustomText(
      {super.key,
      required this.text,
      required this.size,
      this.lines = 1,
      this.fontWeight = FontWeight.normal,
      this.height = 1,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: height,
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
