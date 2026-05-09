part of 'slider_bloc.dart';

class SliderState extends Equatable {
  final double sliderValue;

  const SliderState({
    this.sliderValue = 0.5,
  });

  SliderState copyWith({double? sliderValue}) {
    return SliderState(sliderValue: sliderValue ?? this.sliderValue);
  }

  @override
  List<Object> get props => [sliderValue];
}
