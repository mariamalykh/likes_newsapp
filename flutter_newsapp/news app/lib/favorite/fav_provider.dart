import 'package:flutter/cupertino.dart';
import '../models/article.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<ArticleModel> _favs = [];

  List<ArticleModel> get favs => _favs;

  void toggleFavorite(ArticleModel article) {
    final isExist = _favs.contains(article);
    if (isExist) {
      _favs.remove(article);
    } else {
      _favs.add(article);
    }
    notifyListeners();
  }

  bool isExists(ArticleModel article) {
    final exists = _favs.contains(article);
    return exists;
  }
}
