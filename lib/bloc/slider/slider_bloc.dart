import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderState()) {
    on<SliderValueEvent>(_sliderValue);
  }

  void _sliderValue(SliderValueEvent event, Emitter<SliderState> emit) {
    emit(state.copyWith(sliderValue: event.slider));
  }
}
