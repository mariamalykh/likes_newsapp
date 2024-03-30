import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../favorite/fav_provider.dart';
import '../models/article.dart';
import '../screens/item_screen.dart';

class Announcement extends StatefulWidget {
  // const Announcement({super.key});
  final String imageAddress, heading, description, url, content;
  final ArticleModel article;

  const Announcement(
      {super.key,
      required this.imageAddress,
      required this.heading,
      required this.description,
      required this.url,
      required this.content,
      required this.article});

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      Provider.of<FavoriteProvider>(context, listen: false)
          .toggleFavorite(widget.article);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticlePage(
                url: widget.url,
                imageAddress: widget.imageAddress,
                description: widget.description,
                heading: widget.heading,
                content: widget.content,
              ),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                widget.imageAddress,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Text('Error loading image T-T',
                      style: Theme.of(context).textTheme.titleMedium);
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(widget.heading,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.description,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      toggleLike();
                    },
                    icon: Provider.of<FavoriteProvider>(context, listen: false)
                            .isExists(widget.article)
                        ? const Icon(Icons.favorite, color: Colors.deepPurple)
                        : const Icon(Icons.favorite_border,
                            color: Colors.deepPurple),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
