import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/service/product_details.dart';
import 'package:ecommerce/service/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController with StateMixin {
  List<DataProducts> products = [];

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      var productService = ProductService();
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

  void fetchProductById(int id) async {
    try {
      var productService = ProductDetailsService();
      change(null, status: RxStatus.loading());
      var fetchedProduct = await productService.fetchProductById(id);
      change([fetchedProduct], status: RxStatus.success());
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching product by id: $e');
      change(null, status: RxStatus.error('Failed to fetch product by id'));
    }
  }
}
