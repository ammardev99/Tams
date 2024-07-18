import 'package:flutter/material.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/components/widgets.dart';
import 'package:tams/models/favorite_controller.dart';
import 'package:tams/models/service.dart';

class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Service> favServices = FavoriteService.favServiceList;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite Services',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace:
            Container(decoration: BoxDecoration(gradient: myGradient())),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text('${favServices.length} Favorites'),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: favServices.length,
                itemBuilder: (context, index) {
                  Service service = favServices[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: showService(service, [favServices, index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
