import 'dart:convert';
import 'package:http/http.dart' as http;
import 'slider_model.dart';

class SliderService {
  static Future<List<SliderItem>> fetchSliders() async {
    final response =
        await http.get(Uri.parse("https://69920a5f8f29113acd3d0c68.mockapi.io/imgss"));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => SliderItem.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load sliders");
    }
  }
}
