import 'dart:convert';

import 'package:doodleblue_ecommerce/core/services/api/core/api_response_model.dart';
import 'package:doodleblue_ecommerce/core/services/api/repositories/products_repo.dart';
import 'package:doodleblue_ecommerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _products = [];
  bool _isLoading = true;  // Default to true for shimmer on first load

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    print("Api try called...");
    ApiResponseModel? response = await ProductsRepository.getProductListApiTrigger();
    print("Response --> ${response.success}");
    print("Response data --> ${response.data}");
    if(response.success) {
      _products = List<ProductModel>.from(
          response.data.map((json) => ProductModel.fromJson(json))
      );
    }
    print('products length ---> ${products.length}');

      try{

      } catch(e){
        "Api call error -> $e";
      }


    _isLoading = false;
    notifyListeners();
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 18) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }
}
