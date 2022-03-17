import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<Increment>((event, emit) => _addToValue(1, true, emit));
    on<Decrement>((event, emit) => _addToValue(-1, false, emit));
    on<Reset>((event, emit) =>
        _resetCounter(event.value, event.wasIncremented, emit));
  }

  void _addToValue(int toAdd, bool wasIncremented, Emitter<CounterState> emit) {
    emit(CounterState(
        counter: state.counter + toAdd, wasIncremented: wasIncremented));
  }

  void _resetCounter(
      int value, bool wasIncremented, Emitter<CounterState> emit) {
    emit(CounterState(counter: value, wasIncremented: wasIncremented));
  }
}
