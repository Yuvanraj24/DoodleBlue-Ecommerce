class ApiResponseModel<ApiResponseData> {
  final bool success;
  int? statusCode;
  final ApiResponseData? data;

  ApiResponseModel({this.success = false, this.statusCode, this.data});
}