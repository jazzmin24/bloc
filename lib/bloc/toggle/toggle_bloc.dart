import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'toggle_event.dart';
part 'toggle_state.dart';

class ToggleBloc extends Bloc<ToggleEvent, ToggleState> {
  ToggleBloc() : super(const ToggleState()) {
    on<ToggleButtonPressed>(_toggle);
  }

  void _toggle(ToggleButtonPressed event, Emitter<ToggleState> emit) {
    emit(state.copyWith(toggleValue: !state.toggleValue));
  }
}
