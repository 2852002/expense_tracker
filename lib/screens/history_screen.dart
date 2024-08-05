import 'package:flutter/material.dart';
import 'package:noble/screens/home/home_screen.dart';

import 'details/transaction_item_detail.dart';
import 'home/transaction_items.dart';
import 'statistics_page.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get screen size
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var padding = screenWidth * 0.04;
    var iconSize = screenWidth * 0.07;
    var cardPadding = screenWidth * 0.02;
    var cardFontSize = screenWidth * 0.04;
    var titleFontSize = screenWidth * 0.05;
    var subtitleFontSize = screenWidth * 0.04;

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
            'History',
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
                GestureDetector(
                  onTap: () {
                      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StatisticsPage()),
                );
                  },
                  child: Container(
                    
                    height: iconSize,
                    width: iconSize,
                    padding: EdgeInsets.all(cardPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(iconSize / 3),
                      color: Colors.grey,
                    ),
                    child: Icon(
                      Icons.bar_chart,
                      size: iconSize * 0.5,
                      color: Colors.white,
                    ),
                  ),
                ),
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
                    'Current Month',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: titleFontSize,
                    ),
                  ),
                   Container(
                  height: iconSize,
                  width: iconSize,
                  padding: EdgeInsets.all(cardPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(iconSize / 3),
                    color: Colors.grey,
                  ),
                  child: Icon(
                    Icons.bar_chart,
                    size: iconSize * 0.5,
                    color: Colors.white,
                  ),
                ),
                ],
              ),
              SizedBox(height: padding),
              Text(
                'December',
                style: TextStyle(color: Colors.white, fontSize: subtitleFontSize),
              ),
              SizedBox(height: padding * 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: cardPadding),
                      child: Card(
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(padding),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.ac_unit_sharp, size: iconSize, color: Colors.white),
                              SizedBox(height: padding * 0.5),
                              Text(
                                '10%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: cardFontSize,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
             SizedBox(height: padding),
              Text(
                'Today',
                style: TextStyle(color: Colors.white, fontSize: subtitleFontSize),
              ),
             SizedBox(height: padding),
        
                Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    TransactionItems(
                      icon: Icons.flight_takeoff,
                      onTab: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => TransactionItemDetail()));
                      },
                      color: Colors.blue,
                      date: "24 feb",
                      remark: "Travelling",
                      time: "3 Day Ago",
                      total: "\$445.000",
                    ),
                    TransactionItems(
                      icon: Icons.fastfood,
                      onTab: () {},
                      color: Colors.orange,
                      date: "27 feb",
                      remark: "Food",
                      time: "Today",
                      total: "\$45.000",
                    ),
                    TransactionItems(
                      icon: Icons.man_outlined,
                      onTab: () {},
                      color: Colors.deepOrange,
                      date: "24 jan",
                      remark: "Yoga",
                      time: "1 Month Ago",
                      total: "\$445.000",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
