import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'toggle_event.dart';
part 'toggle_state.dart';

class ToggleBloc extends Bloc<ToggleEvent, ToggleState> {
  ToggleBloc() : super(ToggleInitial()) {
    on<ToggleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
