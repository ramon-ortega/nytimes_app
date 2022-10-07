import 'package:flutter/material.dart';
import 'package:nytimes_app/src/services/news_service.dart';
import 'package:provider/provider.dart';

import '../widgets/news_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Movies",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: (newsService.headlines.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : NewsList(
              news: newsService.headlines,
            ),
    );
  }
}
