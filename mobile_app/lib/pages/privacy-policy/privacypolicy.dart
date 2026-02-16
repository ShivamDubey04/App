import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ AppBar with Back Button
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 👈 Go back
          },
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Your Data, Our Responsibility.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 12),
              Divider(thickness: 1),
              SizedBox(height: 16),

              Text(
                "Privacy Policy",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 12),

              Text(
                "A privacy policy is a legal document that explains how an organization collects, uses, stores, and protects a user’s personal information. It informs users about data collection, usage, security, and their rights such as accessing or deleting their data.",
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                ),
              ),

              SizedBox(height: 24),

              _InfoCard(
                title: "Information We Collect",
                icon: Icons.folder_open,
                content:
                    "We may collect personal information such as your name, email address, phone number, and other details you provide while using our platform. We may also collect technical information including IP address, browser type, device details, and usage data to help us improve our services and user experience.",
              ),

              SizedBox(height: 16),

              _InfoCard(
                title: "How We Use Your Data",
                icon: Icons.settings,
                content:
                    "The information collected is used to provide and maintain our services, respond to inquiries, improve platform functionality, communicate important updates, and ensure a secure and efficient user experience. Data may also be used for analytical purposes.",
              ),

             SizedBox(height: 16),

              _InfoCard(
                title: "How We Use Your Data",
                icon: Icons.settings,
                content:
                    "The information collected is used to provide and maintain our services, respond to inquiries, improve platform functionality, communicate important updates, and ensure a secure and efficient user experience. Data may also be used for analytical purposes.",
              ),



 SizedBox(height: 16),

              _InfoCard(
                title: "How We Use Your Data",
                icon: Icons.settings,
                content:
                    "The information collected is used to provide and maintain our services, respond to inquiries, improve platform functionality, communicate important updates, and ensure a secure and efficient user experience. Data may also be used for analytical purposes.",
              ),



 SizedBox(height: 16),

              _InfoCard(
                title: "How We Use Your Data",
                icon: Icons.settings,
                content:
                    "The information collected is used to provide and maintain our services, respond to inquiries, improve platform functionality, communicate important updates, and ensure a secure and efficient user experience. Data may also be used for analytical purposes.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Reusable Card Widget
class _InfoCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;

  const _InfoCard({
    required this.title,
    required this.content,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 28),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
