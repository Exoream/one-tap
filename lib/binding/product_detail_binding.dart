import 'package:ecommerce/controller/product_controller.dart';
import 'package:get/instance_manager.dart';

class ProductDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => ProductController());
  }
}
