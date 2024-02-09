import 'package:dio/dio.dart';
import 'package:ecommerce/model/product_model.dart';

class ProductService {
  Dio dio = Dio();
  static const url = 'https://fakestoreapi.com/products';

  Future<List<DataProducts>> fetchData() async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        List<DataProducts> products =
            responseData.map((json) => DataProducts.fromJson(json)).toList();
        return products;
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}
