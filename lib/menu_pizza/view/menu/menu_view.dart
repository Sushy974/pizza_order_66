import 'package:flutter/material.dart';

import '../../../app/enum/enum_menu.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: const _Slector(),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: Theme.of(context).canvasColor,
            child: const MenuList(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class MenuList extends StatelessWidget {
  const MenuList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 950,
          width: 1100,
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                child: Row(
                  children: [
                    const Text(
                      'Nom Pizza',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const Column(
                      children: [
                        Text(
                          'Base Pizza',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Vegane',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            child: Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) =>
                                    const Text('Ingrediant'),
                                itemCount: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            itemCount: 100,
          ),
        ),
      ],
    );
  }
}

class _Slector extends StatelessWidget {
  const _Slector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage('assets/images/pizzaOrder66.png'),
        ),
        SizedBox(
          height: 300,
          width: 200,
          child: ListView.builder(
            itemBuilder: (context, index) => Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  MenuListItems.getMenuItems()[index],
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            itemCount: Menu.values.length,
          ),
        ),
      ],
    );
  }
}
