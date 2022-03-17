part of 'counter_bloc.dart';

class CounterState {
  int counter;
  bool wasIncremented;
  CounterState({required this.counter , required this.wasIncremented});
}

class CounterInitial extends CounterState {
  CounterInitial() : super(counter: 0,wasIncremented: false);
}

class CounterIncremented extends CounterState {
  CounterIncremented({required int counter}) : super(counter: counter,wasIncremented: false);
}
