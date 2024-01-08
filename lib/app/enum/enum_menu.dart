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

class MenuListItems {
  static List<String> getMenuItems() {
    return Menu.values
        .map(
          (e) => e.name,
        )
        .toList();
  }
}
