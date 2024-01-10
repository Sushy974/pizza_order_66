import 'package:flutter/material.dart';
import 'package:pizza_order_66/app/enum/enum_menu.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            child: const _Paiment(),
          ),
        ),
      ],
    );
  }
}

class _Slector extends StatelessWidget {
  const _Slector();

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
                  Menu.values.map((e) => e.name).toList()[index],
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

class MenuList extends StatelessWidget {
  const MenuList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              primary: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text(
                            'Nom Pizza',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Base Pizza',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Icon(Icons.eco, color: Colors.lightGreen),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                // height: 100,
                                child: Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    primary: true,
                                    itemBuilder: (context, index) =>
                                        const Text('Ingrediant'),
                                    itemCount: 3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              itemCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class _Paiment extends StatelessWidget {
  const _Paiment();

  @override
  Widget build(BuildContext context) {
    const textstyle = TextStyle(
      fontSize: 20,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            flex: 15,
            child: SingleChildScrollView(
              primary: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ORDER',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Order 66 : ',
                    style: textstyle,
                  ),
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    primary: true,
                    itemBuilder: (context, index) => const Text(
                      '- Pizza Marguerita',
                      style: textstyle,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Total :',
                            style: textstyle,
                          ),
                          Text(
                            '15 euros 17 centimes',
                            style: textstyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('PAYER'),
            ),
          ),
        ],
      ),
    );
  }
}
