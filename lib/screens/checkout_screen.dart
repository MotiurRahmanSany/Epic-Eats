import 'package:epic_eats/components/pay_now.dart';
import 'package:epic_eats/providers/location_provider.dart';
import 'package:epic_eats/providers/order_history_provider.dart';
import 'package:epic_eats/providers/track_order_provider.dart';
import 'package:epic_eats/screens/order_confirmed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/my_button.dart';
import '../providers/cart_provider.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void makePayment() {
    if (formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return PayNow(
              onConfirm: () {
                Navigator.of(context).pop();
                //! setting track order to true
                ref.read(trackOrderNotifierProvider.notifier).setIsTracking(true);

                ref.read(orderHistoryNotifierProvider.notifier).createOrder(
                    items: ref.read(cartNotifierProvider),
                    totalAmount: ref.read(cartNotifierProvider.notifier).totalPrice,
                    userLocation: ref.read(locationNotifierProvider),
                    );
                ref.read(cartNotifierProvider.notifier).clearCart();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderConfirmedScreen(),
                  ),
                );
              },
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              totalAmount: ref
                  .watch(cartNotifierProvider.notifier)
                  .totalPrice
                  .toStringAsFixed(2),
              userLocation: ref.watch(locationNotifierProvider),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final payableAmount = ref.watch(cartNotifierProvider.notifier).totalPrice;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.transparent,
        elevation: 0,

        // Add a back button to the app bar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardWidget(
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      showBackView: showBackView,
                      onCreditCardWidgetChange: (value) {},
                    ),
                    CreditCardForm(
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      onCreditCardModelChange: (value) {
                        setState(() {
                          cardNumber = value.cardNumber;
                          expiryDate = value.expiryDate;
                          cardHolderName = value.cardHolderName;
                          cvvCode = value.cvvCode;
                          showBackView = value.isCvvFocused;
                        });
                      },
                      formKey: formKey,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: MyButton(
                onTap: makePayment,
                buttonText: 'Pay Now \$${payableAmount.toStringAsFixed(2)}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
