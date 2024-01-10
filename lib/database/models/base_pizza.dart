enum BasePizza {
  creme,
  sauceTomate,
}

extension BasePizzaX on BasePizza {
  String get nom {
    switch (this) {
      case BasePizza.creme:
        return 'Créme';
      case BasePizza.sauceTomate:
        return 'Sauce Tomate';
    }
  }

  bool get vegetarien {
    switch (this) {
      case BasePizza.creme:
        return false;
      case BasePizza.sauceTomate:
        return true;
    }
  }
}

BasePizza getBasePizzaFromString(String basePizzaStr) {
  switch (basePizzaStr) {
    case 'Créme':
      return BasePizza.creme;
    case 'Sauce Tomate':
      return BasePizza.sauceTomate;
    default:
      throw Exception('Base de pizza inconnue : $basePizzaStr');
  }
}
