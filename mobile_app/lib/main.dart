import 'package:flutter/material.dart';
import 'package:mobile_app/pages/about_page.dart';
import 'package:mobile_app/pages/home_page.dart';
import 'package:mobile_app/pages/post/article_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/aboutus': (context) => const ArticlePage(slug: "What-Is-Figma"),
        '/article':(context) => const ArticlePage(slug: "What-Is-Figma"),
      },
    );
  }
}
