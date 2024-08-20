import 'package:flutter/cupertino.dart';
import 'package:pizza_order_66/app/app_bloc/app_bloc.dart';
import 'package:pizza_order_66/order_pizza/view/order_pizza/order_pizza_page.dart';
import 'package:pizza_order_66/pizza_manager/view/pizza_manager/pizza_manager_page.dart';

import '../../authentification/connexion/view/connexion_page.dart';
import '../../menu_pizza/view/menu/menu_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.user:
      return [MenuPage.page()];
    case AppStatus.unauthenticated:
      return [ConnexionPage.page()];
    case AppStatus.inscription:
      return [ConnexionPage.page()];
    case AppStatus.admin:
      return [PizzaManagerPage.page()];
    case AppStatus.cook:
      return [OrderPizzaPage.page()];
  }
}
