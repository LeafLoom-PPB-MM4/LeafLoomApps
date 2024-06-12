import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/authentication/screens/payment/success.dart';
import 'package:leafloom/features/home/controller/cart_controller.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final CartController cartController = Get.find();
  String cardNumber = "5450 7879 4864 7854";
  String cardExpiry = "10/25";
  String cardHolderName = "Sukhaenah Tri Utami";
  String bankName = "Bank BNI";
  String cvv = "456";

  final Color kWhiteColor = Colors.white;
  final Color kLightColor = Colors.grey;
  final Color kPrimaryColor = Colors.blue;
  final Color kDarkColor = Colors.black;

  final List<PaymentDetail> paymentDetailList = [];

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
              frontBackground: const CardBackground(color: Colors.black),
              backBackground: const CardBackground(color: Colors.white),
              cardType: CardType.masterCard,
              showShadow: true,
            ),
            const StickyLabel(text: "Transaction Details"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: paymentDetailList.length,
              itemBuilder: (context, index) {
                final paymentDetail = paymentDetailList[index];
                return ListTile(
                  title: Text(paymentDetail.details),
                  subtitle: Text(paymentDetail.date),
                  trailing: Text(
                    'Rp ${paymentDetail.amount}',
                    style: TextStyle(color: paymentDetail.textColor),
                  ),
                );
              },
            ),
            const StickyLabel(text: "Nota Penjualan"),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Pembayaran',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Rp ${cartController.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const StickyLabel(text: "Transaction Details"),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartController.cartItems[index];
                      return ListTile(
                        leading: Image.network(product.imageUrl),
                        title: Text(product.name),
                        subtitle: Text('Rp ${product.price}'),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Get.to(Success());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 94, 49),
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 12.0),
              ),
              child: Text(
                'Lanjutkan',
                style: const TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
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
        ],
      ),
    );
  }
}

class CardBackground {
  final Color color;

  const CardBackground({required this.color});
}

enum CardType { masterCard }
