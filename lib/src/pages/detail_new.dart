import 'package:flutter/material.dart';

import '../models/news_model.dart';

class DetailNew extends StatelessWidget {
  const DetailNew({super.key});

  @override
  Widget build(BuildContext context) {
    final Result news = ModalRoute.of(context)!.settings.arguments as Result;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          _PosterAndTitle(news: news),
        ],
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Result news;

  const _PosterAndTitle({
    required this.news,
    // super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          news.displayTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        FadeInImage(
          placeholder: const AssetImage("assets/no-image.png"),
          image: NetworkImage(news.multimedia.src),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          news.headline,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Text("Review: "),
              const SizedBox(
                width: 15,
              ),
              Expanded(child: Text(news.summaryShort)),
            ],
          ),
        )
      ],
    );
  }
}
