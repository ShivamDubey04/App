import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_app/pages/post/article_model.dart';

class ArticleService {
  Future<Article> fetchArticle(String slug) async {
    final response = await http.get(
      Uri.parse('https://scms-lqwu.onrender.com/post/post/$slug'),
    );

    return Article.fromJson(jsonDecode(response.body));
  }
}
