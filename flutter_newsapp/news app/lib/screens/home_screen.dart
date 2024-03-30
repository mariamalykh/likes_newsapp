import 'package:flutter/material.dart';
import 'package:mytest/screens/favorite_screen.dart';
import 'package:mytest/theme/change_theme_button.dart';

import '../help/announcement.dart';
import '../help/feed.dart';
import '../models/article.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ArticleModel> articles = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getFeed();
  }

  getFeed() async {
    Feed feed = Feed();
    await feed.getFeed();
    articles = feed.feed;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Latest News",
                    style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: TabBarView(
            children: [
              _loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
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
                                    Announcement currAnnouncement =
                                        Announcement(
                                            imageAddress:
                                                articles[index].urlToImage,
                                            heading: articles[index].title,
                                            description:
                                                articles[index].description,
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
              const ChangeThemeButton(),
              const FavoritePage(),
            ],
          ),
          bottomNavigationBar: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.fiber_new),
                text: "News",
              ),
              Tab(
                icon: Icon(Icons.brightness_3),
                text: "Theme",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "Liked",
              )
            ],
          ),
        ));
  }
}
