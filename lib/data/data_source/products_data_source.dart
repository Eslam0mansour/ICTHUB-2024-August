import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_8/data/data_models/product_data_model.dart';

class ProductsDataSource {
  static bool isLoading = true;
  static bool isError = false;
  static String errorMessage = '';

  static final List<ProductDataModel> items = [];

  static Future<bool> getProducts() async {
    try {
      print('getProducts called');

      ///first: use http package to get data from the API (https://fakestoreapi.com/procts)
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));

      ///second: check if the response is successful
      if (response.statusCode == 200) {
        /// decode the response body from JSON to List<dynamic>
        List<dynamic> productsList = jsonDecode(response.body);

        for (Map<String, dynamic> item in productsList) {
          ///first: create a new instance of ProductDataModel
          ///and pass the required parameters from the map item
          /// in list which get it from the API after decoding the response body
          ProductDataModel product = ProductDataModel.fromMap(item);

          ///second: add the product to the items list
          items.add(product);
        }

        ///third: update the UI
        isLoading = false;
      } else {
        throw Exception('${response.statusCode}');
      }
      return true;
    } catch (e) {
      /// if status code is not 200, or any other error occurred
      /// the thrown exception will be caught here
      /// and implement the error handling logic
      print(e);
      isLoading = false;
      isError = true;
      errorMessage = e.toString();
      return false;
    }
  }
}
