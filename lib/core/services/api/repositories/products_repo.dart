import 'package:doodleblue_ecommerce/core/constants/api/api_constants.dart';
import 'package:doodleblue_ecommerce/core/services/api/core/api_handler.dart';
import 'package:doodleblue_ecommerce/core/services/api/core/api_response_model.dart';

class ProductsRepository {
  static Future<ApiResponseModel> getProductListApiTrigger() async {
    final response = await ApiHandler.get(ApiConstants.productList);
    return response;
  }
}