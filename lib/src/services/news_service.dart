import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nytimes_app/src/models/news_model.dart';

const String _newsUrl = "https://api.nytimes.com/svc/movies/v2";
const String _apikey = "0StFmuL2p2007JmwX4EsdRFfgw5cC60T";

class NewsService with ChangeNotifier {
  List<Result> headlines = [];

  NewsService() {
    getHeadlines();
  }

  Future getHeadlines() async {
    final url = Uri.parse("$_newsUrl/reviews/all.json?api-key=$_apikey");

    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);

    headlines.addAll(newsResponse.results);
    notifyListeners();
  }
}
