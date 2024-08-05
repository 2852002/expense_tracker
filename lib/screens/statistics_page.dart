import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'home/home_screen.dart';
import 'home/transaction_items.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<_ChartData> dailyData = [
    _ChartData('Mon', 500),
    _ChartData('Tue', 600),
    _ChartData('Wed', 700),
    _ChartData('Thu', 800),
    _ChartData('Fri', 750),
    _ChartData('Sat', 650),
    _ChartData('Sun', 700),
  ];

  @override
  Widget build(BuildContext context) {
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
          'Statistics',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 16), // Gap after AppBar
              Center(
                child: Column(
                  children: [
                    Text(
                      '\$ 15,000.00',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Total Balance',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(text: 'Daily'),
                  Tab(text: 'Weekly'),
                  Tab(text: 'Monthly'),
                ],
                indicatorColor: Colors.white,
              ),
              SizedBox(height: 32),
              Container(
                height: 300, // Set height for the chart
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildDailyChart(),
                    _buildDailyChart(),
                    _buildDailyChart(),
                  ],
                ),
              ),
              SizedBox(height: 16),
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

  Widget _buildDailyChart() {
    return SizedBox(
      height: 200, // Set height for the chart
      width: double.infinity, // Set width for the chart
      child: SfCartesianChart(
        backgroundColor: Color(0xFF17151C),
        primaryXAxis: CategoryAxis(
          labelStyle: TextStyle(color: Colors.white),
          axisLine: AxisLine(color: Colors.white),
          majorTickLines: MajorTickLines(color: Colors.white),
          majorGridLines: MajorGridLines(color: Colors.transparent),
        ),
        primaryYAxis: NumericAxis(
          labelStyle: TextStyle(color: Colors.white),
          axisLine: AxisLine(color: Colors.white),
          majorTickLines: MajorTickLines(color: Colors.white),
          majorGridLines: MajorGridLines(color: Colors.white24),
        ),
        series: <CartesianSeries<dynamic, dynamic>>[
          LineSeries<_ChartData, String>(
            dataSource: dailyData,
            xValueMapper: (_ChartData data, _) => data.day,
            yValueMapper: (_ChartData data, _) => data.amount,
            color: Color(0xFF4F45F6),
            markerSettings: MarkerSettings(isVisible: true, color: Color(0xFF4F45F6)),
          )
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.day, this.amount);
  final String day;
  final double amount;
}
