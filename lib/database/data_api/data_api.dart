import 'package:pizza_order_66/database/models/article.dart';

abstract class DataApi {
  Future<void> saveArticle(Article article);
  Stream<List<Article>> getArticles();
}
