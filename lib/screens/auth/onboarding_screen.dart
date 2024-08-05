import 'package:flutter/material.dart';
import '../home/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  void _skip() {
    // Navigate to the next screen after onboarding
    // Replace with the actual screen you want to navigate to
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => BankingHomeScreen()),
    );
  }

  void _next() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17151C),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              OnboardingPage(
                image: 'assets/onboard1.png', // Replace with your image asset path
                text: 'Easy way to manage your e-wallet',
                text1: 'Manage your every penny and transaction with the case',
                showButton: true,
                onNext: _next,
                onSkip: _skip,
              ),
              OnboardingPage(
                image: 'assets/onboard2.png', // Replace with your image asset path
                text: 'The simplest way to save your money',
                text1: 'Connect your money to your friends, family & experience',
                showButton: true,
                onNext: _skip, // Changed to _skip
                onSkip: _skip,
              ),
            ],
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: _skip,
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String text;
  final String text1;
  final bool showButton;
  final VoidCallback? onNext;
  final VoidCallback onSkip;

  OnboardingPage({
    required this.image,
    required this.text,
    required this.showButton,
    this.onNext,
    required this.onSkip,
    required this.text1,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Color(0xFF17151C),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  image,
                  width: 350,
                  height: 350,
                ),
              ],
            ),
          ),
          Container(
            height: screenHeight * 0.4, // 40% of the screen height
            decoration: BoxDecoration(
              color: Color(0xFF323138),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
            ),
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  text1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                if (showButton)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: FloatingActionButton(
                        onPressed: onNext,
                        backgroundColor: Colors.white,
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Icon(Icons.arrow_forward, color: Color(0xFF323138)),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

