import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_order_66/database/data_api/data_api.dart';
import 'package:pizza_order_66/database/models/article.dart';

class FirestoreApi implements DataApi {
  FirestoreApi(this.firestoreInstance) {
    firestoreInstance
      ..useFirestoreEmulator('localhost', 8080)
      ..enablePersistence();
  }
  final FirebaseFirestore firestoreInstance;
  final CollectionReference articleCollection =
      FirebaseFirestore.instance.collection('Article');

  @override
  Future<void> saveArticle(Article article) async {
    return articleCollection.doc().set(article.toJSON());
  }

  Stream<List<Article>> getArticles() {
    return articleCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        print(doc.id);
        return Article.fromJSON(
          map: doc.data()! as Map<String, dynamic>,
          uid: doc.id,
        );
      }).toList();
    });
  }
}
