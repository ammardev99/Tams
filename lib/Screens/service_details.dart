import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/models/favorite_controller.dart';
import 'package:tams/models/order.dart';
import 'package:tams/models/service.dart';
import 'package:tams/modules/order/view.dart';

class ServiceDetails extends StatefulWidget {
  const ServiceDetails({super.key});

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  late Service service;
  @override
  void initState() {
    super.initState();
    // Get the arguments passed from the previous screen
    final arguments = Get.arguments as List;
    final List<Service> services = arguments[0];
    final int index = arguments[1];
    // Get the service at the provided index
    service = services[index];
  }

  @override
  Widget build(BuildContext context) {
    RxBool isFavorited = FavoriteService.isFavorite(service).obs;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: whiteColor,
          ),
          backgroundColor: secondaryColor,
          actions: [
            IconButton(onPressed: () {
              FavoriteService.toggleFavorite(service); // Toggle favorite state
              isFavorited.value
                  ? Get.snackbar(
                      'Favorite Removed',
                      '${service.title} has been removed from your favorites',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: secondaryColor03,
                    )
                  : Get.snackbar(
                      'Favorite Added',
                      '${service.title} has been added to your favorites',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: secondaryColor03,
                    );
              isFavorited.value = !isFavorited.value;
            }, icon: Obx(() {
              return Icon(
                isFavorited.value ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              );
            })),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.memory(
                    service.image,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                heading1(service.title, Colors.black),
                sizeBox(10, 20),
                icontInfo(
                  Icons.person,
                  service.category == '1'
                      ? 'Category: All'
                      : service.category == '2'
                          ? 'Category: Female'
                          : 'Category: Male',
                ),
                sizeBox(15, 15),
                icontInfo(
                  Icons.nights_stay_outlined,
                  'Duration: ${service.duration} days'.toString(),
                ),
                sizeBox(15, 15),
                icontInfo(
                  Icons.date_range_outlined,
                  'Date: ${service.startdate}',
                ),
                sizeBox(15, 15),
                icontInfo(
                  Icons.receipt_long_outlined,
                  'Price: ${service.price.toString()} /Per Head',
                  Colors.red[300],
                ),
                sizeBox(10, 20),
                Text(
                  service.description,
                  textAlign: TextAlign.justify,
                ),
                sizeBox(10, 20),
                Center(
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: heading(service.title, Colors.black),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              heading(
                                "Are you sure you want to order this service?",
                                Colors.black,
                              ),
                            ],
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OutlinedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: textInfo('Cancel'),
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all(secondaryColor),
                                    elevation: WidgetStateProperty.all(10),
                                  ),
                                  onPressed: () {
                                    debugPrint('Service selected');
                                    selectedService.copy(service);
                                    Get.to(
                                      OrderPage(),
                                      arguments: service.id,
                                    );
                                  },
                                  child: heading(
                                    'Confirm',
                                    Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(child: heading("Order Now", Colors.white)),
                    ),
                  ),
                ),
                sizeBox(10, 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
