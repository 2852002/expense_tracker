import 'package:flutter/material.dart';

enum CardType { visa, mastercard, americanExpress }

class CreditCard extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String cardExpiry;
  final CardType cardType;

  const CreditCard({
    required this.cardNumber,
    required this.cardHolderName,
    required this.cardExpiry,
    required this.cardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Card Number: $cardNumber',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Card Holder: $cardHolderName',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Expiry Date: $cardExpiry',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCardLogo(),
              Icon(Icons.more_vert),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardLogo() {
    switch (cardType) {
      case CardType.visa:
        return Image.asset(
          'assets/visa_logo.png', // Replace with your asset path
          width: 50,
        );
      case CardType.mastercard:
        return Image.asset(
          'assets/mastercard_logo.png', // Replace with your asset path
          width: 50,
        );
      case CardType.americanExpress:
        return Image.asset(
          'assets/amex_logo.png', // Replace with your asset path
          width: 50,
        );
    }
  }
}
