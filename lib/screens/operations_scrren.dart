import 'package:flutter/material.dart';
import '../widgets/card_widget.dart';
import 'home/home_screen.dart'; // Import the CardWidget class

class OperationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get screen size
    var screenWidth = MediaQuery.of(context).size.width;
    var padding = screenWidth * 0.04;
    var iconSize = screenWidth * 0.07;
    var cardPadding = screenWidth * 0.02;
    var cardFontSize = screenWidth * 0.03;
    var titleFontSize = screenWidth * 0.04;

    return Scaffold(
      backgroundColor: Color(0xFF17151C),
      appBar: AppBar(
        backgroundColor: Color(0xFF17151C),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BankingHomeScreen()),
            );
          },
        ),
        title: Text(
          'Operations',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(width: padding),
                Container(
                  height: iconSize,
                  width: iconSize,
                  padding: EdgeInsets.all(cardPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(iconSize / 3),
                    color: Colors.grey,
                  ),
                  child: Icon(
                    Icons.notifications,
                    size: iconSize * 0.5,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: padding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Templates',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: titleFontSize,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                    label: Text(
                      "View all",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.white38,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    icon: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
              SizedBox(height: padding * 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(1, (index) {
                  return CardWidget(
                    icon: Icons.add,
                    text: 'Create Templates',
                    height: 150,
                    width: 150,
                    iconSize: iconSize,
                    fontSize: cardFontSize,
                  );
                }),
              ),
              SizedBox(height: padding),
              Text(
                'Transfers',
                style: TextStyle(color: Colors.white, fontSize: titleFontSize),
              ),
              SizedBox(height: padding),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CardWidget(
                      icon: Icons.account_balance,
                      text: 'Own card and my accounts',
                      height: 150,
                      width: 150,
                      iconSize: iconSize,
                      fontSize: cardFontSize,
                    ),
                    SizedBox(width: cardPadding),
                    CardWidget(
                      icon: Icons.work_sharp,
                      text: 'Domestic to bank card',
                      height: 150,
                      width: 150,
                      iconSize: iconSize,
                      fontSize: cardFontSize,
                    ),
                    SizedBox(width: cardPadding),
                    CardWidget(
                      icon: Icons.wordpress_rounded,
                      text: 'Noble bank account',
                      height: 150,
                      width: 150,
                      iconSize: iconSize,
                      fontSize: cardFontSize,
                    ),
                  ],
                ),
              ),
              SizedBox(height: padding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIconTextWidget(Icons.open_with_sharp, 'Mobile Operators', iconSize, titleFontSize),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.2,
                    height: padding * 1,
                  ),
                  _buildIconTextWidget(Icons.security_update_warning_outlined, 'Utilities', iconSize, titleFontSize),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.2,
                    height: padding * 1,
                  ),
                  _buildIconTextWidget(Icons.help, 'Operations', iconSize, titleFontSize),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconTextWidget(IconData icon, String text, double iconSize, double fontSize) {
    return Row(
      children: [
        CircleAvatar(
          radius: iconSize * 0.5,
          backgroundColor: const Color.fromARGB(255, 110, 112, 112),
          child: Icon(icon, color: Colors.white, size: iconSize * 0.5),
        ),
        SizedBox(width: 20),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
      ],
    );
  }
}
