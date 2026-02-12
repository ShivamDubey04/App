class ArticleComponent {
  final String type;
  final String data;

  ArticleComponent({
    required this.type,
    required this.data,
  });

  factory ArticleComponent.fromJson(Map<String, dynamic> json) {
    return ArticleComponent(
      type: json['componentType'],     // ✅ FIXED
      data: json['componentData'],     // ✅ FIXED
    );
  }
}
