import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pizza_order_66/database/models/dessert.dart';
import 'package:pizza_order_66/database/models/pizza.dart';

import '../../../database/models/article.dart';
import '../../../database/models/base_pizza.dart';
import '../../../database/models/ingredient.dart';
import '../../bloc/form_article_bloc/form_article_bloc.dart';

class FormArticleView extends StatelessWidget {
  const FormArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<FormArticleBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BlocListener<FormArticleBloc, FormArticleState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isSuccess) {
            Navigator.of(context).pop();
          }
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(
              8,
            ),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: DropdownButton<TypeArticle>(
                      isExpanded: true,
                      value: state.typeArticle,
                      onChanged: (TypeArticle? newValue) {
                        return context.read<FormArticleBloc>().add(
                              TypeArticleChange(typeArticle: newValue!),
                            );
                      },
                      items: TypeArticle.values
                          .map<DropdownMenuItem<TypeArticle>>(
                              (TypeArticle value) {
                        return DropdownMenuItem<TypeArticle>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    decoration:
                        const InputDecoration(label: Text('Nom Article')),
                    onChanged: (value) => context.read<FormArticleBloc>().add(
                          NomChange(nom: value),
                        ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    decoration:
                        const InputDecoration(label: Text('Description')),
                    onChanged: (value) => context.read<FormArticleBloc>().add(
                          DescriptionChange(description: value),
                        ),
                  ),
                ),
                Visibility(
                  visible: state.typeArticle.type == Dessert,
                  child: Card(
                    color: Colors.grey,
                    child: SizedBox(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Text('Végétarien'),
                            Checkbox(
                              value: state.vegetarien.value,
                              onChanged: (value) {
                                return context.read<FormArticleBloc>().add(
                                      VegetarienChange(vegetarien: value!),
                                    );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: state.typeArticle.type == Pizza,
                  child: Card(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('Base Pizza :'),
                          ),
                          SizedBox(
                            width: 400,
                            child: DropdownButton<BasePizza>(
                              isExpanded: true,
                              value: state.basePizza,
                              onChanged: (BasePizza? newValue) {
                                return context.read<FormArticleBloc>().add(
                                      BasePizzaChange(basePizza: newValue!),
                                    );
                              },
                              items: BasePizza.values
                                  .map<DropdownMenuItem<BasePizza>>(
                                      (BasePizza value) {
                                return DropdownMenuItem<BasePizza>(
                                  value: value,
                                  child: Text(value.nom),
                                );
                              }).toList(),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxHeight: 300,
                            ),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    const Text('Ingrédients Pizza :'),
                                    SizedBox(
                                      width: 400,
                                      child: ListView.builder(
                                        primary: true,
                                        shrinkWrap: true,
                                        itemCount: state.listIngredient.length,
                                        itemBuilder: (context, index) => Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: DropdownButton<
                                                  IngredientEnum>(
                                                isExpanded: true,
                                                value:
                                                    state.listIngredient[index],
                                                onChanged: (IngredientEnum?
                                                    newIngredient) {
                                                  return context
                                                      .read<FormArticleBloc>()
                                                      .add(
                                                        ChangeIngredientPizzaChange(
                                                          index,
                                                          ingredient:
                                                              newIngredient!,
                                                        ),
                                                      );
                                                },
                                                items: IngredientEnum.values.map<
                                                        DropdownMenuItem<
                                                            IngredientEnum>>(
                                                    (IngredientEnum value) {
                                                  return DropdownMenuItem<
                                                      IngredientEnum>(
                                                    value: value,
                                                    child: Text(value.nom),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                            Expanded(
                                              child: ElevatedButton(
                                                onPressed: () => context
                                                    .read<FormArticleBloc>()
                                                    .add(
                                                      RemouveIngredientPizzaChange(
                                                          index: index),
                                                    ),
                                                child: const Icon(
                                                    Icons.remove_rounded),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 400,
                                      child: ElevatedButton(
                                        onPressed: () => context
                                            .read<FormArticleBloc>()
                                            .add(AddIngredientPizzaChange()),
                                        child: const Text('Ajouter Ingrédiant'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            return context
                                .read<FormArticleBloc>()
                                .add(SaveArticle());
                          },
                          child: state.status.isInProgress
                              ? const CircularProgressIndicator()
                              : const Text('Enregistre Article')),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
