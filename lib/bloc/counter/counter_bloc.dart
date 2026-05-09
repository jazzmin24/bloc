import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
  }

  void _increment(IncrementEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counterValue: state.counterValue + 1));
  }

  void _decrement(DecrementEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counterValue: state.counterValue - 1));
  }
}




//------------------FLOW OF THE APP------------------

// App Start
//   └── CounterBloc created
//         └── initial state: CounterState(counterValue: 0)
//               └── UI shows "0"

// User taps "+"
//   └── IncrementEvent added to stream
//         └── _increment handler called
//               └── copyWith creates CounterState(counterValue: 1)
//                     └── emit() pushes new state
//                           └── Equatable: 0 ≠ 1, rebuild!
//                                 └── UI shows "1"

// User taps "+"  again
//   └── same flow → CounterState(counterValue: 2)
//         └── UI shows "2"

// User taps "-"
//   └── DecrementEvent added to stream
//         └── _decrement handler called
//               └── copyWith creates CounterState(counterValue: 1)
//                     └── emit() pushes new state
//                           └── UI shows "1"