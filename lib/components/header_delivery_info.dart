import 'package:epic_eats/components/deliver_description.dart';
import 'package:epic_eats/components/deliver_search_box.dart';
import 'package:flutter/material.dart';

class HeaderDeliveryInfo extends StatelessWidget {
  const HeaderDeliveryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(top: 65),
      child: Center(
        child: Column(
          children: [
            Divider(
              color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.2),
              // thickness: 2,
              endIndent: 0,
              indent: 0,
            ),
            const SizedBox(height: 20),
            DeliverSearchBox(), 
            const SizedBox(height: 20),
            const DeliverDescription(),
          ],
        ),
      ),
    );
  }
}
