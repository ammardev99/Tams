import 'package:get/get.dart';
import 'package:tams/models/service.dart';

class FavoriteController extends GetxController {
  var favServiceList = <Service>[].obs;

  void addToFavorites(Service service) {
    favServiceList.add(service);
  }

  void removeFromFavorites(Service service) {
    favServiceList.remove(service);
  }
}




class FavoriteService {
  static List<Service> favServiceList = [];

  static bool isFavorite(Service service) {
    return favServiceList.contains(service);
  }

  static void toggleFavorite(Service service) {
    if (isFavorite(service)) {
      favServiceList.remove(service);
    } else {
      favServiceList.add(service);
    }
  }
}
