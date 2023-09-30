import 'package:dio/dio.dart';
import 'package:ecom_task/modals/cart_modals.dart';

class ApiHelper {
  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();
  Dio dio = Dio();
  final String api = "https://dummyjson.com/products?limit=100";

  Future<List<Products>?> assign() async {
    Response response = await dio.get(api);
    if (response.statusCode == 200) {
      List data = response.data['products'];
      List<Products> allproducts =
          data.map((e) => Products.formMap(data: e)).toList();
      return allproducts;
    } else {
      return null;
    }
  }
}
