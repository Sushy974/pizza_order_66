import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_pizza_event.dart';
part 'order_pizza_state.dart';

class OrderPizzaBloc extends Bloc<OrderPizzaEvent, OrderPizzaState> {
  OrderPizzaBloc() : super(OrderPizzaInitial()) {
    on<OrderPizzaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
