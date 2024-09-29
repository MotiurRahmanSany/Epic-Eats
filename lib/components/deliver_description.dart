import 'package:epic_eats/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeliverDescription extends ConsumerWidget {
  const DeliverDescription({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double deliveryFee = ref.watch(cartStateProvider.notifier).deliveryFee;
    return Container(
      padding: const EdgeInsets.all(15),
      // margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        // color: Theme.of(context).colorScheme.secondary,
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 2,
        ),
        // borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                '\$${deliveryFee.toStringAsFixed(2)}',
              ),
              Text(
                'Delivery Fee',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
          Column(
            children: [
              const Text('15-30 min'),
              Text(
                'Delivery Time',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              )
            ],
          ),
        ],
      ),
    );
  }
}
