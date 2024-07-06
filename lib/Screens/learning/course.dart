import 'package:flutter/material.dart';
import 'package:tams/Screens/learning/lesson.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/components/widgets.dart';
class Course extends StatelessWidget {
  const Course({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.white,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: myGradient(),
            ),
          ),
        ),
        body: Column(children: [
          courseTopCard("HTML Introduction", "", "assets/course_logo/html.png"),
          lessonCard("What is HTML", "15 min", context, const PlayLesson()),
          sizeBox(0, 8),
          lessonCard("History of HTML", "10 min", context, const PlayLesson()),
          sizeBox(0, 8),
          lessonCard("Installation", "50 min", context, const PlayLesson()),
          sizeBox(0, 8),
        ]),
      ),
    );
  }
}