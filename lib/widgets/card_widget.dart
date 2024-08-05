import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final double height;
  final double width;
  final double iconSize;
  final double fontSize;

  CardWidget({
    required this.icon,
    required this.text,
    this.height = 160,
    this.width = 130,
    required this.iconSize,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final double padding = width * 0.15;

    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Colors.grey.shade600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: iconSize, color: Colors.white),
              SizedBox(height: 10),
              
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                ),
                textAlign: TextAlign.center,
              ),
              // SizedBox(height: 10),
             
            ],
          ),
        ),
      ),
    );
  }
}
