part of 'slider_bloc.dart';

sealed class SliderEvent extends Equatable {
  const SliderEvent();

  @override
  List<Object> get props => [];
}

class SliderValueEvent extends SliderEvent {
  double slider;
  SliderValueEvent({required this.slider});

  @override
  List<Object> get props => [slider];
}
