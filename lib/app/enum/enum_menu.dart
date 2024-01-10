enum Menu {
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
