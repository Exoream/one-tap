import 'package:dio/dio.dart';
import 'package:ecommerce/model/product_model.dart';

class ProductDetailsService {
  Dio dio = Dio();
  static const baseUrl = 'https://fakestoreapi.com/products';

  Future<DataProducts?> fetchProductById(int id) async {
    try {
      final url = '$baseUrl/$id';
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final responseData = response.data;
        return DataProducts.fromJson(responseData);
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}
