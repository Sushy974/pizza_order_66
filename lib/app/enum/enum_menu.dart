import 'package:pizza_order_66/database/models/article.dart';
import 'package:pizza_order_66/database/models/boisson.dart';
import 'package:pizza_order_66/database/models/dessert.dart';
import 'package:pizza_order_66/database/models/pizza.dart';

enum Menu {
  all,
  pizza,
  boisson,

  dessert,
}

extension MenuX on Menu {
  String get name {
    switch (this) {
      case Menu.pizza:
        return 'Pizza';
      case Menu.boisson:
        return 'Boisson';
      case Menu.dessert:
        return 'Dessert';
      case Menu.all:
        return 'Tout';
    }
  }

  Type get type {
    switch (this) {
      case Menu.pizza:
        return Pizza;
      case Menu.boisson:
        return Boisson;
      case Menu.dessert:
        return Dessert;
      case Menu.all:
        return Article;
    }
  }
}

enum MenuOrder {
  order,
}

extension MenuOrderX on MenuOrder {
  String get name {
    switch (this) {
      case MenuOrder.order:
        return 'Order';
    }
  }
}
