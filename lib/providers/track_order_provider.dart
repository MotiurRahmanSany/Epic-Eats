// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'track_order_provider.g.dart';

@riverpod
class TrackOrderNotifier extends _$TrackOrderNotifier {
  @override
  bool build() => false;

  void setIsTracking(bool isTracking) {
    state = isTracking;
  }
}
