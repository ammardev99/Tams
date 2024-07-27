import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tams/modules/blogs/blog_ui.dart';
import 'package:tams/modules/favorite_list_screen.dart';
import 'package:tams/tams_services.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final screens = [
    const ServiceListScreen(),
    // const Learning(),
    const FavoriteListScreen(),
    // const Cart(),
    const BlogsScreen(),
    const Profile(),
    // Learning(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: screens[currentIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          child: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            color: const Color(0xFF249FFF),
            buttonBackgroundColor: const Color(0xFF053365),
            animationDuration: const Duration(milliseconds: 500),
            height: 60,
            items: const [
              Icon(Icons.line_style_rounded),
              Icon(Icons.favorite),
              Icon(Icons.image),
              Icon(Icons.person),
            ],
            onTap: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
