part of 'slider_bloc.dart';

sealed class SliderEvent extends Equatable {
  const SliderEvent();

  @override
  List<Object> get props => [];
}

class SliderValueEvent extends SliderEvent {
  double slider;
  SliderValueEvent({required this.slider});              //bloc has no way to know where the user dragged it — the value must travel inside the event

  @override
  List<Object> get props => [slider];
}



//COUNTER - Value calculated	inside bloc (+1/-1)	
//SLIDER - Value calculated comes from UI