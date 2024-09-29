import 'package:flutter/material.dart';

class PayNow extends StatelessWidget {
  const PayNow({
    super.key,
    required this.onConfirm,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.totalAmount,
  });

  final void Function() onConfirm;
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final String totalAmount;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceAround,
      title: const Text('Payment Confirmation', textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Card Number: $cardNumber',
            textAlign: TextAlign.center,
          ),
          Text('Expiry Date: $expiryDate'),
          Text('Card Holder Name: $cardHolderName'),
          Text('CVV Code: $cvvCode'),
          Text(
            'Total Payable Amount: \$$totalAmount',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
          const Text(
            'Pay Now and Confirm order? ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
          },
          label: const Text('Cancel'),
        ),
        ElevatedButton.icon(
          onPressed: onConfirm,
          label: const Text('Confirm'),
        ),
      ],
    );
  }
}
