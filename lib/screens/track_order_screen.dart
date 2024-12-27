import 'package:epic_eats/providers/track_order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrackOrderScreen extends ConsumerWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: ref.watch(trackOrderNotifierProvider)
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // add estimated time here
                    Text('Estimated time for delivery: '),
                    // put stepper here
                    // put animations here
                  ],
                ),
              )
            : const Center(
                child: Text(
                  'You have no orders pending right now! Go place an order!',
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
              ));
  }
}
