import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_order_66/app/app_bloc/app_bloc.dart';
import 'package:pizza_order_66/authentification/connexion/bloc/connexion_bloc.dart';

class ConnexionView extends StatelessWidget {
  const ConnexionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
          title: const Text('Connexion'),
          backgroundColor: Theme.of(context).primaryColor),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(context.watch<AppBloc>().state.user?.uid ?? 'No User'),
                    Text(context.watch<ConnexionBloc>().state.email.value),
                    Text(context.watch<ConnexionBloc>().state.pass.value),
                    SizedBox(
                      width: 500,
                      child: TextField(
                        onChanged: (value) => context.read<ConnexionBloc>().add(
                              EmailChange(email: value),
                            ),
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      child: TextField(
                        onChanged: (value) => context.read<ConnexionBloc>().add(
                              PassChange(pass: value),
                            ),
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Password'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<ConnexionBloc>().add(OnConnexion()),
                      child: const Text('Connexion'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
