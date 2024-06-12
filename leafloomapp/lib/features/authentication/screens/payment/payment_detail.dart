import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/home/controller/cart_controller.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final CartController cartController = Get.find();
  String cardNumber = "5450 7879 4864 7854",
      cardExpiry = "10/25",
      cardHolderName = "John Travolta",
      bankName = "ICICI Bank",
      cvv = "456";

  final Color kWhiteColor = Colors.white;
  final Color kLightColor = Colors.grey;
  final Color kPrimaryColor = Colors.blue;
  final Color kDarkColor = Colors.black;

  final List<PaymentDetail> paymentDetailList = [
    PaymentDetail(
        date: "12/06/2023",
        details: "Amazon Purchase",
        amount: "50.00",
        textColor: Colors.red),
    PaymentDetail(
        date: "14/06/2023",
        details: "Spotify Subscription",
        amount: "9.99",
        textColor: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: const Text("Payment Details"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCard(
              cardNumber: cardNumber,
              cardExpiry: cardExpiry,
              cardHolderName: cardHolderName,
              bankName: bankName,
              cvv: cvv,
              // showBackSide: true,
              frontBackground: CardBackground(color: Colors.black),
              backBackground: CardBackground(color: Colors.white),
              cardType: CardType.masterCard,
              showShadow: true,
            ),
            const StickyLabel(text: "Transaction Details"),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: cartController.cartItems.length,
            //     itemBuilder: (context, index) {
            //       final product = cartController.cartItems[index];
            //       return ListTile(
            //         leading: Image.network(product.imageUrl),
            //         title: Text(product.name),
            //         subtitle: Text('Rp ${product.price}'),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class PaymentDetail {
  final String date;
  final String details;
  final String amount;
  final Color textColor;

  PaymentDetail({
    required this.date,
    required this.details,
    required this.amount,
    required this.textColor,
  });
}

class StickyLabel extends StatelessWidget {
  final String text;

  const StickyLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Text(
        text,
        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

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
            ? [BoxShadow(color: Colors.black26, blurRadius: 10.0)]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cardNumber,
              style: TextStyle(color: Colors.white, fontSize: 22.0)),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(cardHolderName,
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              Text(cardExpiry,
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(bankName, style: TextStyle(color: Colors.white, fontSize: 16.0)),
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
