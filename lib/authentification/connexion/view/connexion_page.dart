import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_order_66/authentification/connexion/bloc/connexion_bloc.dart';
import 'package:pizza_order_66/authentification/connexion/view/connexion_view.dart';

import '../../../database/data_repository/data_auth_repository.dart';

class ConnexionPage extends StatelessWidget {
  const ConnexionPage({super.key});

  static Page<dynamic> page() =>
      const MaterialPage<void>(child: ConnexionPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnexionBloc(
        dataAuthRepository: context.read<DataAuthRepository>(),
      ),
      child: const ConnexionView(),
    );
  }
}
