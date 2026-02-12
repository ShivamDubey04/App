import 'package:flutter/material.dart';
import 'package:mobile_app/pages/post/article_view.dart';
import 'package:mobile_app/pages/post/article_model.dart';
import 'package:mobile_app/pages/post/service/article_service.dart';

class ArticlePage extends StatefulWidget {
  final String slug;

  const ArticlePage({super.key, required this.slug});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late Future<Article> _articleFuture;

  @override
  void initState() {
    super.initState();
    _articleFuture = ArticleService().fetchArticle(widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Article"),
      ),
      body: FutureBuilder<Article>(
        future: _articleFuture,
        builder: (context, snapshot) {
          // Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          // No data
          if (!snapshot.hasData) {
            return const Center(child: Text("Article not found"));
          }

          // Success
          return ArticleView(article: snapshot.data!);
        },
      ),
    );
  }
}
