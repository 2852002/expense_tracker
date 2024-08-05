import 'package:flutter/material.dart';

import '../screens/details/transaction_item_detail.dart';
import '../screens/home/transaction_items.dart';

class TransactionHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "History",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                  color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: ListView(
              shrinkWrap: true,


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
        ),
      ],
    );
  }
}