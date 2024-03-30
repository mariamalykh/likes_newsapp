import 'package:flutter/material.dart';
import 'package:mytest/favorite/fav_provider.dart';
import 'package:provider/provider.dart';

import '../help/announcement.dart';
import '../models/article.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    articles = Provider.of<FavoriteProvider>(context, listen: false).favs;
  }

  List<ArticleModel> articles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      Announcement currAnnouncement = Announcement(
                          imageAddress: articles[index].urlToImage,
                          heading: articles[index].title,
                          description: articles[index].description,
                          url: articles[index].url,
                          content: articles[index].content,
                          article: articles[index]);
                      return currAnnouncement;
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
