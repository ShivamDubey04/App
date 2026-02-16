class SliderItem {
  final String imageUrl;
  final String slug;

  SliderItem({
    required this.imageUrl,
    required this.slug,
  });

  factory SliderItem.fromJson(Map<String, dynamic> json) {
    return SliderItem(
      imageUrl: json['imageUrl'],
      slug: json['slug'],
    );
  }
}
