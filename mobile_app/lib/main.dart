import 'package:flutter/material.dart';
import 'package:mobile_app/comp/slider/image_slider_component.dart';
import 'package:mobile_app/pages/home_page.dart';
import 'package:mobile_app/pages/privacy-policy/privacypolicy.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

/* ---------------- HOME SCREEN ---------------- */

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(), // Home
    CoursePage(), // Course
    ArticlePages(), // Articles also goes to HomePage
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavItem(
              icon: Icons.location_on,
              label: "Home",
              isActive: currentIndex == 0,
              onTap: () => setState(() => currentIndex = 0),
            ),
            NavItem(
              icon: Icons.bookmark_border,
              label: "Course",
              isActive: currentIndex == 1,
              onTap: () => setState(() => currentIndex = 1),
            ),
            NavItem(
              icon: Icons.notifications_none,
              label: "Articles",
              isActive: currentIndex == 2,
              onTap: () => setState(() => currentIndex = 2), // redirect to HomePage
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------- PAGES ---------------- */

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: [
              const SizedBox(height: 20), // 👈 Top spacing

          const ImageSliderComponent(),

          // ---- PRIVACY POLICY TEXT ----
          const SizedBox(height: 20),

          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PrivacyPolicyPage(),
                  ),
                );
              },
              child: const Text(
                "Privacy Policy",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Courses Page",
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Articles Page",
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}

/* ---------------- COMPONENTS ---------------- */

class Box extends StatelessWidget {
  final double w, h;
  const Box(this.w, this.h, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? Colors.white : Colors.white54),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.white54,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
