import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_order_66/database/data_api/data_api.dart';
import 'package:pizza_order_66/database/models/article.dart';

class FirestoreApi implements DataApi {
  final CollectionReference articleCollection =
      FirebaseFirestore.instance.collection('Article');
  @override
  Future<void> saveArticle(Article article) async {
    return articleCollection.doc().set(article.toJSON());
  }

  Stream<List<Article>> getArticles() {
    return articleCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Article.fromJSON(doc.data()! as Map<String, dynamic>);
      }).toList();
    });
  }
}
