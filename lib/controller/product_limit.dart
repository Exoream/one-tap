import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/service/product_limit.dart';
import 'package:get/get.dart';

class ProductLimitController extends GetxController with StateMixin {
  List<DataProducts> products = [];

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      var productService = ProductLimitService();
      change(null, status: RxStatus.loading());
      var fetchedProducts = await productService.fetchData();
      products.assignAll(fetchedProducts);
      change(products, status: RxStatus.success());
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching data: $e');
      change(null, status: RxStatus.error('Failed to fetch data'));
    }
  }
}
