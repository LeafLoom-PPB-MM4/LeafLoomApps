import 'package:flutter/material.dart';

class CategoryName extends StatelessWidget {
  final String text;

  const CategoryName({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black, // or any color you prefer
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                top: 7, bottom: 11, left: 8), // Added left padding
            child: Divider(),
          ),
        ),
      ],
    );
  }
}
