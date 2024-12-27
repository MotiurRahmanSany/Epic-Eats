import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/food.dart';

part 'addon_provider.g.dart';


@riverpod
class AddonNotifier extends _$AddonNotifier {
  @override
  List<Addon> build() => [];

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
