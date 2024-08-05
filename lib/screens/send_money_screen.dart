import 'package:flutter/material.dart';
import 'package:noble/screens/payment_success_screen.dart';
import 'home/home_screen.dart';

class SendMoneyPage extends StatefulWidget {
  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> with SingleTickerProviderStateMixin {
  final List<String> contacts = List<String>.generate(50, (i) => "Contact $i");
  final FocusNode _focusNode = FocusNode();
  late AnimationController _controller;
  late Animation<double> _animation;
  final TextEditingController _amountController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _sendMoney() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentSuccessPage()),
    );
  }

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
            'Send Money',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Positioned(
                      //   left: 60,
                      //   child: CircleAvatar(
                      //     radius: 26,
                      //     backgroundColor: Color.fromARGB(255, 68, 68, 68),
                      //     child: Icon(Icons.person, color: Colors.white),
                      //   ),
                      // ),
                      // Positioned(
                      //   right: 60,
                      //   child: CircleAvatar(
                      //     radius: 26,
                      //     backgroundColor: Color.fromARGB(255, 68, 68, 68),
                      //     child: Icon(Icons.person, color: Colors.white),
                      //   ),
                      // ),
                      ScaleTransition(
                        scale: _animation,
                        child: CircleAvatar(
                          radius: 36,
                          backgroundColor: Color.fromARGB(255, 85, 85, 85),
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFF2C2C34),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '\$',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            focusNode: _focusNode,
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.white, fontSize: 24),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter amount',
                              hintStyle: TextStyle(color: Colors.white54),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 40,
                    width: 370,
                    child: ElevatedButton(
                      onPressed: _sendMoney,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Color(0xFF4F45F6),
                      ),
                      child: Text(
                        'Send money',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_isLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
