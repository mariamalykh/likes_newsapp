import 'package:flutter_test/flutter_test.dart';
import 'package:mytest/favorite/fav_provider.dart';
import 'package:mytest/models/article.dart';

void main() {
  test('Testing provider for managing favorite articles list', () async {
    //ARRANGE
    final ArticleModel testArticle = ArticleModel(
      author: 'TestAuthor1',
      title: 'TestTitle1',
      description: 'TestDescription1',
      url: 'TestUrl1',
      urlToImage: 'TestUrlToImage1',
      content: 'TestContent1',
    );

    //ACT
    final provider = FavoriteProvider();
    provider.toggleFavorite(testArticle);
    bool exists = provider.isExists(testArticle);

    //ASSERT
    expect(testArticle.isLiked, true);
    expect(exists, true);
  });
}
