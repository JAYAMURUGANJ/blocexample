part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class Reset extends CounterEvent {
  final int value;
  final bool wasIncremented;
  Reset(this.value,this.wasIncremented);

}
