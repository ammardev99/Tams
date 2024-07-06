import 'package:flutter/material.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/components/widgets.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 8,
        // centerTitle: true,
        title: const Text(
          "Orders",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        flexibleSpace:
            Container(decoration: BoxDecoration(gradient: myGradient())),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          sizeBox(0, 10),
          Container(
            height: 40,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10)),
          ),
          sizeBox(0, 20),
          notesCard(
            context,
            "Order Title",
            "12 Nov 2023",
            const Icon(Icons.push_pin_rounded),
          ),
          notesCard(
            context,
            "Tour or Order Title",
            "4 Jan 2024",
          ),
          notesCard(
            context,
            "Order Title",
            "27 Feb 2024",
          ),
          notesCard(
            context,
            "Order Name",
            "19 Jan 2024",
          ),
        ],
      ),
    );
  }
}
