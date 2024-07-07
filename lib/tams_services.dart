// lib/screens/service_list_screen.dart
import 'package:flutter/material.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/models/api_service.dart';
import 'package:tams/models/service.dart';

class ServiceListScreen extends StatefulWidget {
  const ServiceListScreen({super.key});

  @override
  _ServiceListScreenState createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  late Future<List<Service>> _servicesFuture;
  late Future<int> _numberOfServicesFuture;

  @override
  void initState() {
    super.initState();
    _servicesFuture = ApiService().fetchServices();
    _numberOfServicesFuture = ApiService().fetchNumberOfServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 8,
        // centerTitle: true,
        title: const Text(
          "Tours",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace:
            Container(decoration: BoxDecoration(gradient: myGradient())),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizeBox(5, 5),
          FutureBuilder<int>(
            future: _numberOfServicesFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                int numberOfServices = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(' Services: $numberOfServices'),
                );
              } else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              return const Center(
                child: Text('Loading...'),
              );
            },
          ),
          const SizedBox(height: 10),
          Expanded(
            child: FutureBuilder<List<Service>>(
              future: _servicesFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Service> services = snapshot.data!;
                  return ListView.builder(
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.memory(services[index].image),
                        title: Text('${index + 1}. ${services[index].title}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Description: ${services[index].description}'),
                            Text('Price: \$${services[index].price}'),
                            Text('Start Date: ${services[index].startdate}'),
                            Text('Category: ${services[index].category}'),
                            Text('Duration: ${services[index].duration} days'),
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
