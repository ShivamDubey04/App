import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {

const AboutPage({super.key});

@override
Widget build(BuildContext context)
{
  return Scaffold(

      appBar: AppBar(title: const Text("About Us")),
      body: Center(
        child: ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(context, '/home');
  },
  child: const Text("Go To Home Page"),
)

      ),


  );
}

}