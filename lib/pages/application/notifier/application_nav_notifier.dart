import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_nav_notifier.g.dart';

@riverpod
class ApplicationNavIndex extends _$ApplicationNavIndex{
  @override
  int build() {
    return 0;
  }
  //the state is the current value exposed by this notifier which is int with return of 0
  void changeIndex(int val){
    state = val;
    print(state);
  }
}