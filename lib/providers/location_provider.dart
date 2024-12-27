import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'location_provider.g.dart';

@riverpod
class LocationNotifier extends _$LocationNotifier {
  @override
  String build() => 'Boalia, Rajshahi';

  void setLocation(String location){
    state = location;
  }
}
