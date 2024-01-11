enum IngredientEnum {
  fromage,
  poivron,
  champignon,
  olives,
  pepperoni,
  jambon,
}

extension IngredientEnumX on IngredientEnum {
  Object get article {
    switch (this) {
      case IngredientEnum.fromage:
        return Fromage();
      case IngredientEnum.poivron:
        return Poivron();
      case IngredientEnum.champignon:
        return Champignon();
      case IngredientEnum.olives:
        return Olives();
      case IngredientEnum.pepperoni:
        return Pepperoni();
      case IngredientEnum.jambon:
        return Jambon();
    }
  }

  String get nom {
    switch (this) {
      case IngredientEnum.fromage:
        return 'Fromage';
      case IngredientEnum.poivron:
        return 'Poivron';
      case IngredientEnum.champignon:
        return 'Champignon';
      case IngredientEnum.olives:
        return 'Olives';
      case IngredientEnum.pepperoni:
        return 'Pepperoni';
      case IngredientEnum.jambon:
        return 'Jambon';
    }
  }
}

abstract class Ingredient {
  String get nom;
  bool get vegetarien;
}

class Fromage extends Ingredient {
  // Doit être initialisé ou défini par un constructeur

  Fromage({this.vegetarien = true});
  @override
  String get nom => 'Fromage';
  @override
  bool vegetarien;
}

class Poivron extends Ingredient {
  Poivron({this.vegetarien = true});
  @override
  String get nom => 'Poivron';
  @override
  bool vegetarien;
}

class Champignon extends Ingredient {
  Champignon({this.vegetarien = true});
  @override
  String get nom => 'Champignon';
  @override
  bool vegetarien;
}

class Olives extends Ingredient {
  Olives({this.vegetarien = true});
  @override
  String get nom => 'Olives';
  @override
  bool vegetarien;
}

class Pepperoni extends Ingredient {
  Pepperoni({this.vegetarien = false});
  @override
  String get nom => 'Pepperoni';
  @override
  bool vegetarien;
}

class Jambon extends Ingredient {
  Jambon({this.vegetarien = false});
  @override
  String get nom => 'Jambon';
  @override
  bool vegetarien;
}

Ingredient getIngredientFromMap(Map<String, dynamic> ingredientMap) {
  String nom = ingredientMap['nom'] as String;
  bool vegetarien = ingredientMap['vegetarien'] as bool;

  switch (nom.toLowerCase()) {
    case 'fromage':
      return Fromage(vegetarien: vegetarien);
    case 'poivron':
      return Poivron(vegetarien: vegetarien);
    case 'champignon':
      return Champignon(vegetarien: vegetarien);
    case 'olives':
      return Olives(vegetarien: vegetarien);
    case 'pepperoni':
      return Pepperoni(vegetarien: vegetarien);
    case 'jambon':
      return Jambon(vegetarien: vegetarien);
    default:
      throw Exception('Ingrédient inconnu: $nom');
  }
}
