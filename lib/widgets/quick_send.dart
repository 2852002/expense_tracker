import 'package:flutter/material.dart';

class QuickSend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Quick send",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: Center(
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.white, // Solid color
                    child: Icon(
                      Icons.add, // Specify the icon you want to use
                      size: 15.0, // Adjust the size of the icon
                      color: Colors.black, // Adjust the color of the icon
                    ),
                  ),
                ),
              ),
              Container(

                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Color(0xFF4F45F6), // Solid color
                      child: Icon(
                        Icons.person, // Specify the icon you want to use
                        size: 30.0, // Adjust the size of the icon
                        color: Colors.white, // Adjust the color of the icon
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Maxwell', // Display first letter of the name
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Color(0xFF4F45F6), // Solid color
                      child: Icon(
                        Icons.person, // Specify the icon you want to use
                        size: 30.0, // Adjust the size of the icon
                        color: Colors.white, // Adjust the color of the icon
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'John Snow', // Display first letter of the name
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
