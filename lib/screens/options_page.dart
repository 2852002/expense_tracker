import 'package:flutter/material.dart';

class OptionsPage extends StatelessWidget {
  final List<String> items = List<String>.generate(9, (i) => "Item $i");

  final List<IconData> icons = [
    Icons.qr_code,
    Icons.money_sharp,
    Icons.payment_rounded,
    Icons.add_card,
    Icons.credit_score_outlined,
    Icons.safety_check,
    Icons.add_to_photos_rounded,
    Icons.list_alt_outlined,
    Icons.account_balance
  ];

  final List<String> titles = [
    'Scan',
    'Transfer',
    'Pay',
    'Card Order',
    'Credit Order',
    'Insurance',
    'Add template',
    'Add goal',
    'Cheak Balance'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF17151C),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Options',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                'Select the types of operations',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
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
                      title: Text(titles[index], style: TextStyle(color: Colors.white)),
                      trailing: Icon(Icons.arrow_right, color: Color.fromARGB(255, 218, 214, 214)),
                      onTap: () {
                        // Handle the tap event
                        print('Tapped on ${items[index]}');
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 50,),
          ],
        
        ),
    
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Handle the press event
            Navigator.pop(context);
            print('Floating Action Button Pressed');
          },
          child: Icon(Icons.close),
          backgroundColor: Color.fromARGB(255, 129, 129, 129),
          shape: CircleBorder(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
