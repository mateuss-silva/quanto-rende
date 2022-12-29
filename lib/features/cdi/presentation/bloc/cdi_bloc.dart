import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cdi_event.dart';
part 'cdi_state.dart';

class CdiBloc extends Bloc<CdiEvent, CdiState> {
  CdiBloc() : super(CdiInitial()) {
    on<CdiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
