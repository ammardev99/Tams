// lib/screens/blogs_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/components/widgets.dart';
import 'package:tams/models/blog_model.dart';
import 'package:tams/models/fetch_blogs.dart';
import 'package:tams/modules/blogs/add_blog.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: heading('Blogs', whiteColor),
        centerTitle: true,
        backgroundColor: secondaryColor,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: FutureBuilder<List<Blog>>(
          future: BlogApiService().fetchBlogs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No blogs found'));
            } else {
              final blogs = snapshot.data!;
              return ListView.builder(
                itemCount: blogs.length,
                itemBuilder: (context, index) {
                  final blog = blogs[index];
                  return showBlog(blog, index);
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(vertical: 60),
        child: FloatingActionButton(
          onPressed: () {
            Get.to(const AddBlogScreen());
          },
          backgroundColor: secondaryColor,
          elevation: 2,
          child: const Icon(
            Icons.add_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
