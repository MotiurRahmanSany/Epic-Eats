import 'package:epic_eats/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/constants/constants.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Confirmed'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      body: Stack(
        children: [
          Lottie.asset(
            Constants.flaresAnimation,
            repeat: true,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    Constants.orderConfirmedAnimation,
                    repeat: true,
                    width: 120,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Thanks! your food is on the way',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: MyButton(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/track_order');
                      },
                      buttonText: 'Track Order',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
