import 'package:flutter/material.dart';
import 'package:noble/screens/home/home_screen.dart';

class ProfileScreen extends StatelessWidget {
  final List<String> items = [
    'Personal information',
    'Settings',
    'Bonuses',
    'Cashback',
    'Application',
    'Privacy & Security',
    'Log out',
  ];

  final List<IconData> icons = [
    Icons.person,
    Icons.settings,
    Icons.payment_rounded,
    Icons.add_card,
    Icons.app_blocking,
    Icons.privacy_tip,
    Icons.logout,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF17151C),
        appBar: AppBar(
          backgroundColor: Color(0xFF17151C),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BankingHomeScreen()),
            );// H
            },
          ),
          title: Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 70,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500,
                ),
                child: Row(
                  children: [
                    Icon(Icons.person, size: 25, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      "John Doe",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 26,
                        backgroundColor: const Color.fromARGB(255, 110, 112, 112),
                        child: Icon(icons[index], color: Colors.white),
                      ),
                      title: Text(items[index], style: TextStyle(color: Colors.white)),
                      onTap: () {
                        // Handle the tap event
                        print('Tapped on ${items[index]}');
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

