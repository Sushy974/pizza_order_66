part of 'order_pizza_bloc.dart';

abstract class OrderPizzaState extends Equatable {
  const OrderPizzaState();
}

class OrderPizzaInitial extends OrderPizzaState {
  @override
  List<Object> get props => [];
}
