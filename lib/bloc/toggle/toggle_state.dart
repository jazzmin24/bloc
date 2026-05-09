part of 'toggle_bloc.dart';

 class ToggleState extends Equatable {
  final bool toggleValue;

   const ToggleState({
    this.toggleValue = false,
  });
ToggleState copyWith({bool? toggleValue}) {
    return ToggleState(toggleValue: toggleValue ?? this.toggleValue);
  }
  
  @override
  List<Object> get props => [toggleValue];
}

