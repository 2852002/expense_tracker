import 'package:flutter/material.dart';
import 'package:noble/screens/profile_screen.dart';
import 'package:noble/screens/statistics_page.dart';
import '../details/transaction_item_detail.dart';
import '../history_screen.dart';
import '../home/transaction_items.dart';
import '../../widgets/master_card.dart';
import '../operations_scrren.dart';
import '../options_page.dart';
import '../others_screen.dart';
import '../send_money_screen.dart';

class BankingHomeScreen extends StatefulWidget {
  const BankingHomeScreen({Key? key});

  @override
  State<BankingHomeScreen> createState() => _BankingHomeScreenState();
}

class _BankingHomeScreenState extends State<BankingHomeScreen> {
  PageController _pageController = PageController();

  int _currentPage = 0;
  int _selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      HomeScreen(),
      HistoryScreen(),
      // Placeholder for floating action button
      OperationsScreen(),
      OthersScreen(),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF17151C),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF17151C),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.add_circle, size: 40),
            //   label: '',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Operations',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Others',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
                          backgroundColor: Color(0xFF4F45F6),
       
          shape: CircleBorder(),
          child: Icon(Icons.add),
      
          onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OptionsPage()),
            );// Handle floating action button press
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            customAppBar(context),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Balance ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white54,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "\$15,000.00",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your onPressed code here!
                        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HistoryScreen()),
            );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300], // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "History",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
               height: 340,
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: PageController(),
                      onPageChanged: (int page) {
                        // Handle page change
                      },
                      children: [
                        MesterCard(
                          id: "**********34567",
                          balance: '\$600',
                          // color: const Color.fromARGB(255, 180, 148, 236),
                        color: Color(0xFF4F45F6),

                        ),
                        MesterCard(
                          id: "**********54970",
                          balance: '\$60',
                          color: Colors.blueAccent,
                        ),
                        MesterCard(
                          id: "**********50970",
                          balance: '\$300',
                          color: Colors.pinkAccent,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          height: 8,
                          // width: _currentPage == index ? 20 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            // color: _currentPage == index
                            //     ? Colors.white
                            //     : Colors.white54,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      icon: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF4F45F6),
                        ),
                        child: Icon(
                          Icons.arrow_upward,
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                      label: Text(
                        "Send",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white38,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      icon: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF4F45F6),
                        ),
                        child: Icon(
                          Icons.arrow_downward,
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                      label: Text(
                        "Request",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white38,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white54,
                      ),
                      child: Icon(
                        Icons.settings,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
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
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          size: 15.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                       Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SendMoneyPage()),
            );
                    },
                    child: Container(
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
                            backgroundColor: Color(0xFF4F45F6),
                            child: Icon(
                              Icons.person,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Maxwell',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SendMoneyPage()),
            );
                    },
                    child: Container(
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
                            backgroundColor: Color(0xFF4F45F6),
                            child: Icon(
                              Icons.person,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'John Snow',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  TransactionItems(
                    icon: Icons.flight_takeoff,
                    onTab: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TransactionItemDetail()));
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
    );
  }

  Padding customAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                     Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
                },
                child: Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 197, 194, 194),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 25,
                    color: Colors.black,
                  
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                "John Doe",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StatisticsPage()),
                );
                },
                child: Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Icon(
                    Icons.bar_chart,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: Icon(
                  Icons.notifications,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}






