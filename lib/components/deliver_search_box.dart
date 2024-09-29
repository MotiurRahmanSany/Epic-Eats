import 'package:epic_eats/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeliverSearchBox extends ConsumerWidget {
  DeliverSearchBox({super.key});
  final _locationController = TextEditingController();
  void openSearchBox(context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Search your location'),
          content: TextField(
            controller: _locationController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your location',
              prefixIcon: Icon(Icons.location_on_outlined),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(locationProvider.notifier).state =
                    _locationController.text;
              },
              child: const Text('Pick'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocation = ref.watch(locationProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deliver now To',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        GestureDetector(
          onTap: () {
            openSearchBox(context, ref);
          },
          child: Row(
            children: [
              Text(
                currentLocation,
              ),
              const Icon(Icons.keyboard_arrow_down_sharp),
            ],
          ),
        ),
      ],
    );
  }
}