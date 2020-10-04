import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:inshorts/codes/codes.dart';

class Api_widget {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsmodel = null;
    try {
      var response = await client.get(
          'http://newsapi.org/v2/everything?domains=wsj.com&apiKey=75dbb339d8cd4b46bca18e0771566de7');

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsmodel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsmodel;
    }
    return newsmodel;
  }
}
