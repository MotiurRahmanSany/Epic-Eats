import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_tab_provider.g.dart';

@riverpod
class SelectedTab extends _$SelectedTab{
  @override 
  int build() => 0;

  void setIndex(int index){
    state = index;
  }
}