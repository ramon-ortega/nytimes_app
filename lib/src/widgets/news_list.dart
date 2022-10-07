import 'package:flutter/material.dart';
import 'package:nytimes_app/src/models/news_model.dart';

class NewsList extends StatelessWidget {
  final List<Result> news;

  const NewsList({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return _New(news: news[index], index: index);
      },
    );
  }
}

class _New extends StatelessWidget {
  final Result news;
  final int index;

  const _New({
    super.key,
    required this.news,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'detail', arguments: news);
      },
      child: Column(
        children: [
          _CardTopBar(
            news: news,
          ),
          const Divider()
        ],
      ),
    );
  }
}

class _CardTopBar extends StatelessWidget {
  final Result news;
  const _CardTopBar({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Image.network(news.multimedia.src),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(
                    news.displayTitle,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(news.headline),
                  Text(
                    news.dateUpdated.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
