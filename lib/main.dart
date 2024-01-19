// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await bootstrap(() => const App());
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_order_66/app/view/app.dart';
import 'package:pizza_order_66/bootstrap.dart';
import 'package:pizza_order_66/database/data_repository/data_auth_repository.dart';
import 'package:pizza_order_66/database/data_repository/data_repository.dart';
import 'package:pizza_order_66/database/firestore_api/firestore_api.dart';
import 'package:pizza_order_66/database/firestore_api/firestore_auth_api.dart';
import 'package:pizza_order_66/firebase_options.dart';

void main() async {
  await bootstrap(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (BuildContext context) {
            return DataRepository(
              api: FirestoreApi(FirebaseFirestore.instance),
            );
          },
        ),
        RepositoryProvider(
          create: (BuildContext context) {
            return DataAuthRepository(api: FirestoreAuthApi());
          },
        ),
      ],
      child: const App(),
    );
  });
}
