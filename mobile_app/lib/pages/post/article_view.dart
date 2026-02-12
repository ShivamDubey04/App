import 'package:flutter/material.dart';
import 'article_model.dart';

class ArticleView extends StatelessWidget {
  final Article article;

  const ArticleView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            article.headingText,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // Author & category
          Text(
            "By ${article.authorName} • ${article.category}",
            style: TextStyle(color: Colors.grey[600]),
          ),

          const SizedBox(height: 20),

          // Dynamic components
          ...article.components.map((component) {
            if (component.type == "POST_BODY") {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  component.data,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
              );
            }

            if (component.type == "IMAGE_BLOCK") {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(component.data),
                ),
              );
            }

            return const SizedBox.shrink();
          }).toList(),
        ],
      ),
    );
  }
}
