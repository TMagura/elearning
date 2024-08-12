import 'package:riverpod_annotation/riverpod_annotation.dart';
//create a file name where the code will be stored and must have a g.dart and wen generated we dont touch anything
part 'welcome_notifier.g.dart';

@riverpod
class IndexDot extends _$IndexDot{
 @override
 //this build is our stateProvider must provide wat will be returned
 int build(){
  return 0;
 }

 //can change the state value here also
 void changeIndex (int value){
  state = value;
 }
}

//run this command on terminal to generate this code
// "flutter pub run build_runner watch --delete-conflicting-outputs"