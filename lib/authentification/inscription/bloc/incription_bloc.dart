import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'incription_event.dart';
part 'incription_state.dart';

class IncriptionBloc extends Bloc<IncriptionEvent, IncriptionState> {
  IncriptionBloc() : super(IncriptionInitial()) {
    on<IncriptionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
