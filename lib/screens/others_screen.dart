import 'package:flutter/material.dart';

import 'home/home_screen.dart';

class OthersScreen extends StatelessWidget {
  final List<String> titles = [
    'Accounts and cards',
    'Credits',
    'Deposits',
    'Bonuses',
    'Insurance',
    'Online queue',
    'Exchange rates',
    'Branches and ATMs',
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
            );
            },
          ),
          title: Text(
            'Others',
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
          
          
            Expanded(
              child: ListView.builder(
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  if (index == 0 || index == 5) {
                    // Add text above "Accounts and cards" and "Online queue"
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 16,bottom: 20),
                          child: Text(
                            index == 0 ? 'Accounts and cards' : 'Online Queue',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            radius: 26,
                            backgroundColor: const Color.fromARGB(255, 110, 112, 112),
                            child: Icon(Icons.qr_code, color: Colors.white),
                          ),
                          title: Text(titles[index], style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Handle the tap event
                            print('Tapped on ${titles[index]}');
                          },
                        ),
                      ],
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 26,
                          backgroundColor: const Color.fromARGB(255, 110, 112, 112),
                          child: Icon(Icons.qr_code, color: Colors.white),
                        ),
                        title: Text(titles[index], style: TextStyle(color: Colors.white)),
                        onTap: () {
                          // Handle the tap event
                          print('Tapped on ${titles[index]}');
                        },
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 50,),
          ],
        ),
       
      ),
    );
  }
}
