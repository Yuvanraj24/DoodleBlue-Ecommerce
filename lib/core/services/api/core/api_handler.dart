import 'dart:convert';

import 'package:doodleblue_ecommerce/core/constants/api/api_constants.dart';
import 'package:http/http.dart' as http;

import 'api_response_model.dart';

class ApiHandler {
  static Future<dynamic> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
      final url = Uri.parse("${ApiConstants.baseUrl}$endpoint");
      try {
        final response = await http.get(url, headers: headers ?? _defaultHeaders()).timeout(Duration(seconds: 30));
        return _handleResponse(response);
      } catch(e) {
        throw Exception("GET request failed $e");
      }
  }

  static Map<String, String> _defaultHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  static dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return ApiResponseModel(
            success: true,
            statusCode: response.statusCode,
            data: json.decode(response.body));

      case 201:
        return ApiResponseModel(
            success: true,
            statusCode: response.statusCode,
            data: json.decode(response.body));
      case 404:
        throw Exception('Not Found: ${response.body}');
      case 500:
        throw Exception('Internal Server Error: ${response.body}');
      default:
        throw Exception('Unexpected Error: ${response.statusCode}');
    }
  }
}
