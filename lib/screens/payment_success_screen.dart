import 'package:flutter/material.dart';

import 'home/home_screen.dart';

class PaymentSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var width = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Color(0xFF17151C),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: height,
          ),
          child: IntrinsicHeight( // Ensures that the Column sizes itself correctly within the ConstrainedBox
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: height * 0.1),
                  Center(
                    child: Image.asset(
                      'assets/paymentsuccessimage.png', // Replace with your image asset
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Payment Success',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow('Send Money Value:', '\$100', width),
                        _buildInfoRow('Date/Time:', 
                          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}', 
                          width
                        ),
                        _buildInfoRow('Reference Number:', '1234567890', width),
                        _buildInfoRow('Payment Code:', 'PAY123', width),
                        _buildInfoRow('Sender Name:', 'John Doe', width),
                        _buildInfoRow('Location Name:', 'New York', width),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Space to ensure the button is not at the very bottom edge
                  Center(
                    child: SizedBox(
                      height: 42,
                      width: 370,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BankingHomeScreen()),
                          );
                        },
                        child: Text('Back Home', style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4F45F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0), // Adjust spacing as needed
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Detail payment',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: width * 0.4,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: width * 0.4,
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
