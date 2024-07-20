
import 'dart:convert';
import 'package:google_login/model/article.dart';
import 'package:http/http.dart' as http;

class NewsAPI {
  static const String _baseUrl = 'https://newsapi.org/v2';
  final String _apiKey;
  NewsAPI(this._apiKey);

  Future<List<Article>> getTopHeadlines({
    String? country,
    String? query,
    String? category,
    int? pageSize,
  }) async {
    String url = '$_baseUrl/top-headlines?apiKey=$_apiKey';
    if (country != null) {
      url += '&country=$country';
    }
    if (query != null) {
      url += '&q=$query';
    }
    if (category != null) {
      url += '&category=$category';
    }
    if (pageSize != null) {
      url += '&pageSize=$pageSize';
    }

  try {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body)['articles'];
        return jsonData.where((item) => item['title'] != 'Remove' && item['urlToImage'] != null).map((item) => Article.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch news: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching news: $e');
  }

}
}