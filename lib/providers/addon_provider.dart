import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/food.dart';

final addonState = StateNotifierProvider<AddonNotifier, List<Addon>>((ref) {
  return AddonNotifier();
});

class AddonNotifier extends StateNotifier<List<Addon>> {
  AddonNotifier() : super([]);

  void toggleAddon(Addon addon) {
    if (state.contains(addon)) {
      state = state.where((item) => item != addon).toList();
    } else {
      state = [addon, ...state];
    }
  }

  bool isAddonSelected(Addon addon) => state.contains(addon);

  void clearAddons() => state = [];
}
