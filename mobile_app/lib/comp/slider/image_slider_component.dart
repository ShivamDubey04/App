import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/pages/home_page.dart';
import 'slider_service.dart';
import 'slider_model.dart';
import 'package:mobile_app/pages/post/article_page.dart';


class ImageSliderComponent extends StatefulWidget {
  const ImageSliderComponent({super.key});

  @override
  State<ImageSliderComponent> createState() => _ImageSliderComponentState();
}

class _ImageSliderComponentState extends State<ImageSliderComponent> {
  late Future<List<SliderItem>> sliderFuture;

  @override
  void initState() {
    super.initState();
    sliderFuture = SliderService.fetchSliders();
  }



  @override
 @override
Widget build(BuildContext context) {
  return FutureBuilder<List<SliderItem>>(
    future: sliderFuture,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return const SizedBox();
      }

      final sliders = snapshot.data!;

      return CarouselSlider(
        options: CarouselOptions(
          height: 180,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: sliders.map((item) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  ArticlePageNow( slug: item.slug),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          );
        }).toList(),
      );
    },
  );
}

}
