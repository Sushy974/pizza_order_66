import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_order_66/database/data_repository/data_repository.dart';
import 'package:pizza_order_66/pizza_manager/bloc/form_article_bloc/form_article_bloc.dart';
import 'package:pizza_order_66/pizza_manager/view/form_article/form_article_view.dart';

class FormArticlePage extends StatelessWidget {
  const FormArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocProvider(
        create: (context) =>
            FormArticleBloc(dataRepository: context.read<DataRepository>()),
        child: const FormArticleView(),
      ),
    );
  }
}
