// lib/screens/blog_details_screen.dart
import 'package:flutter/material.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/models/blog_model.dart';
import 'package:tams/utili/formating.dart';

class BlogDetailsScreen extends StatelessWidget {
  final Blog blog;

  const BlogDetailsScreen({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: whiteColor,
        ),
        backgroundColor: secondaryColor,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.memory(
                blog.image,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16.0),
              heading1(blog.title, secondaryColor),
              const SizedBox(height: 8.0),
              Text(
                'Location: ${blog.location}',
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Date: ${blog.date}',
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                blog.memory,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.justify,
              ),
              sizeBox(40),
            ],
          ),
        ),
      ),
    );
  }
}
