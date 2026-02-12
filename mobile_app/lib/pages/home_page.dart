import 'package:flutter/material.dart';
import 'package:mobile_app/pages/post/article_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openSlugDialog(BuildContext context) {
    final TextEditingController slugController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter Article Slug"),
          content: TextField(
            controller: slugController,
            decoration: const InputDecoration(
              hintText: "e.g. What-Is-Figma",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                final slug = slugController.text.trim();

                if (slug.isNotEmpty) {
                  Navigator.pop(context); // close dialog

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ArticlePage(slug: slug),
                    ),
                  );
                }
              },
              child: const Text("Open"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HOMEPAGE")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _openSlugDialog(context),
          child: const Text("Open Article by Slug"),
        ),
      ),
    );
  }
}
