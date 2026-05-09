part of 'toggle_bloc.dart';

sealed class ToggleState extends Equatable {
  const ToggleState();
  
  @override
  List<Object> get props => [];
}

final class ToggleInitial extends ToggleState {}
