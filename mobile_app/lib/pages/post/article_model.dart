class Article {
  final String headingText;
  final String authorName;
  final String category;
  final String slug;
  final List<ArticleComponent> components;

  Article({
    required this.headingText,
    required this.authorName,
    required this.category,
    required this.slug,
    required this.components,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    final data = json['data']; // IMPORTANT

    return Article(
      headingText: data['headingText'],
      authorName: data['authorName'],
      category: data['category'],
      slug: data['slug'],
      components: (data['components'] as List)
          .map((e) => ArticleComponent.fromJson(e))
          .toList(),
    );
  }
}

class ArticleComponent {
  final String type;
  final String data;

  ArticleComponent({
    required this.type,
    required this.data,
  });

  factory ArticleComponent.fromJson(Map<String, dynamic> json) {
    return ArticleComponent(
      type: json['componentType'],
      data: json['componentData'],
    );
  }
}
