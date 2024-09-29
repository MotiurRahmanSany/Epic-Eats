import 'package:flutter/material.dart';

class CartOverlayItem extends StatelessWidget {
  const CartOverlayItem({
    super.key,
    required this.billName,
    required this.price,
    this.isBold = false,
  });

  final String price;
  final String billName;
  final bool? isBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          billName,
          style: const TextStyle(
            fontSize: 16,
            // fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          price,
          style: isBold!
              ? const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )
              : const TextStyle(
                  fontSize: 16,
                ),
        ),
      ],
    );
  }
}
