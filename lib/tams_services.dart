import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/components/widgets.dart';
import 'package:tams/models/api_service.dart';
import 'package:tams/models/service.dart';
import 'package:tams/utili/formating.dart';

class ServiceListScreen extends StatefulWidget {
  const ServiceListScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ServiceListScreenState createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  List<Service> _services = []; // List to store fetched services

  @override
  void initState() {
    super.initState();

    _fetchServices(); // Fetch services initially
  }

  RxBool fetching = false.obs;
  Future<void> _fetchServices() async {
    fetching.value =true;
    try {
      // Fetch services from API
      List<Service> fetchedServices = await ApiService().fetchServices();
      setState(() {
        _services = fetchedServices; // Update the list with fetched services
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching services: $e');
      // Handle error as needed
    }
        fetching.value =false;

  }

  Future<void> _refreshServices() async {
    await _fetchServices();
  }

  final sliderImages = [
    Image.asset('assets/images/banner1.png'),
    Image.asset('assets/images/banner2.png'),
    Image.asset('assets/images/banner3.png'),
    Image.asset('assets/images/banner4.png'),
    Image.asset('assets/images/banner5.png'),
    Image.asset('assets/images/banner6.png'),
  ];
  int sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   shadowColor: const Color.fromARGB(255, 0, 0, 0),
      //   elevation: 8,
      //   title: const Text(
      //     "Tours",
      //     style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
      //   ),
      //   centerTitle: true,
      //   flexibleSpace:
      //       Container(decoration: BoxDecoration(gradient: myGradient())),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         _refreshServices;
      //       },
      //       icon: const Icon(Icons.refresh),
      //     )
      //   ],
      // ),
      body: RefreshIndicator(
        onRefresh: _refreshServices,
        child: CustomScrollView(
          slivers: [
// slider
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  gradient: myGradient(),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 5,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    CarouselSlider(
                      items: sliderImages,
                      options: CarouselOptions(
                        height: 120,
                        autoPlayInterval: const Duration(seconds: 4),
                        autoPlayCurve: Curves.easeInOutCirc,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        pauseAutoPlayOnTouch: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            sliderIndex = index;
                          });
                        },
                      ),
                    ),
                    sizeBox(5),
                    AnimatedSmoothIndicator(
                      activeIndex: sliderIndex,
                      count: sliderImages.length,
                      effect: WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Colors.white24,
                        activeDotColor: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: customHeading(
                    'Services ${_services.isEmpty ? '' : _services.length}'),
              ),
            ),

            Obx(() {
              if (fetching.value) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text('Loading...'),
                  ),
                );
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child:
                            showService(_services[index], [_services, index]),
                      );
                    },
                    childCount: _services.length,
                  ),
                );
              }
            }),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     (context, index) {
            //       return Padding(
            //         padding:
            //             const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            //         child: showService(_services[index], [_services, index]),
            //       );
            //     },
            //     childCount: _services.length,
            //   ),
            // ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 80),
            ),
          ],
        ),
      ),

      // body: RefreshIndicator(
      //   onRefresh: _refreshServices,
      //   child: SingleChildScrollView(
      //     scrollDirection: Axis.vertical,
      //     child: Column(
      //       children: [
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             sizeBox(30),
      //             customHeading('Services ${_services.length}'),
      //             const SizedBox(height: 10),
      //             ListView.builder(
      //               shrinkWrap: true,
      //               itemCount: _services.length,
      //               itemBuilder: (context, index) {
      //                 return Padding(
      //                   padding: const EdgeInsets.symmetric(vertical: 5),
      //                   child:
      //                       showService(_services[index], [_services, index]),
      //                 );
      //               },
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
