import "package:get/state_manager.dart";
import 'package:shopx/services/remote_services.dart';

import '../models/products_model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();

      if (products != null) {
        productList.value = products;
      }
    } on Exception catch (e) {
      print(e.toString());
      isLoading(true);
    } finally {
      isLoading(false);
    }
  }
}
