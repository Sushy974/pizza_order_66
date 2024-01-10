import 'package:pizza_order_66/database/data_api/data_api.dart';
import 'package:pizza_order_66/database/models/article.dart';

class DataRepository {
  DataRepository({required this.api});
  final DataApi api;

  Future<void> saveArticle(Article article) {
    return api.saveArticle(article);
  }

  Stream<List<Article>> getArticles() {
    return api.getArticles();
  }
}
