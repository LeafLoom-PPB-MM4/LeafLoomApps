import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  final String cardNumber;
  final String cardExpiry;
  final String cardHolderName;
  final String bankName;
  final String cvv;
  final bool showBackSide;
  final CardBackground frontBackground;
  final CardBackground backBackground;
  final CardType cardType;
  final bool showShadow;

  const CreditCard({
    required this.cardNumber,
    required this.cardExpiry,
    required this.cardHolderName,
    required this.bankName,
    required this.cvv,
    this.showBackSide = false,
    required this.frontBackground,
    required this.backBackground,
    required this.cardType,
    this.showShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: frontBackground.color,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: showShadow
            ? [const BoxShadow(color: Colors.black26, blurRadius: 10.0)]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cardNumber,
              style: const TextStyle(color: Colors.white, fontSize: 22.0)),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(cardHolderName,
                  style: const TextStyle(color: Colors.white, fontSize: 16.0)),
              Text(cardExpiry,
                  style: const TextStyle(color: Colors.white, fontSize: 16.0)),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(bankName,
              style: const TextStyle(color: Colors.white, fontSize: 16.0)),
          const SizedBox(height: 8.0),
          Align(
            alignment: Alignment.centerRight,
            child: Icon(cardType.icon, color: Colors.white, size: 40.0),
          ),
        ],
      ),
    );
  }
}

class CardBackground {
  final Color color;

  const CardBackground({required this.color});
}

enum CardType {
  masterCard(Icons.credit_card);

  final IconData icon;

  const CardType(this.icon);
}
