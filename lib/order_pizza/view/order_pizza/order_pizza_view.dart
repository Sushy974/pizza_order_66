import 'package:flutter/material.dart';
import 'package:pizza_order_66/app/enum/enum_menu.dart';

class OrderPizzaView extends StatelessWidget {
  const OrderPizzaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            color: const Color(0xff429D3A),
            child: const _Slector(),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            child: const OrderList(),
          ),
        ),
      ],
    );
  }
}

class OrderList extends StatelessWidget {
  const OrderList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 5,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          child: Column(
            children: [
              const Text(
                'Order : 66',
                style: TextStyle(fontSize: 30),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        primary: true,
                        itemBuilder: (context, index) => const Row(
                          children: [
                            Icon(Icons.local_pizza, color: Colors.red),
                            Icon(Icons.emoji_food_beverage, color: Colors.blue),
                            Text(
                              ' Pizza Marguerita',
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        itemCount: 3,
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size(150, 75),
                  ),
                ),
                onPressed: () {},
                child: const Text('TERMINER'),
              ),
            ],
          ),
        ),
      ),
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
                  MenuOrder.values.map((e) => e.name).toList()[index],
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            itemCount: MenuOrder.values.length,
          ),
        ),
      ],
    );
  }
}
