import 'package:flutter/material.dart';
import 'package:leafloom/utils/constants/colors.dart';

class CardProductWidget extends StatelessWidget {
  const CardProductWidget({Key? key, required Map<String, dynamic> product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.all(0),
        color: LColors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(
              'assets/images/produk/produk1.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover, // Set the fit property to cover
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 100,
                margin: EdgeInsets.only(left: 8, bottom: 8),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text("Wanita | Rp900.000"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
