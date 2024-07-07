import 'package:flutter/material.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/components/widgets.dart';
import 'package:tams/models/api_service.dart';
import 'package:tams/models/service.dart';

class ServiceListScreen extends StatefulWidget {
  const ServiceListScreen({super.key});

  @override
  _ServiceListScreenState createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  List<Service> _services = []; // List to store fetched services

  @override
  void initState() {
    super.initState();
    _fetchServices(); // Fetch services initially
  }

  Future<void> _fetchServices() async {
    try {
      // Fetch services from API
      List<Service> fetchedServices = await ApiService().fetchServices();
      setState(() {
        _services = fetchedServices; // Update the list with fetched services
      });
    } catch (e) {
      print('Error fetching services: $e');
      // Handle error as needed
    }
  }

  Future<void> _refreshServices() async {
    await _fetchServices(); // Refresh services on pull down or button press
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 8,
        title: const Text(
          "Tours",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace:
            Container(decoration: BoxDecoration(gradient: myGradient())),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshServices, // Fetch services on button press
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshServices, // Refresh services on pull down
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Services ${_services.length}'),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: _services.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: showService(_services[index], [_services, index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
