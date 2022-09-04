import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class ApiClient extends GetxService {
  ApiClient._internal();

  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() {
    return _instance;
  }
  Dio dio = Dio();

  init() async {
    dio.options.baseUrl = 'https://fakestoreapi.com';
    dio.options.connectTimeout = 15000;
    dio.options.receiveTimeout = 15000;
  }

  Future<Response> get(String path, Map<String, dynamic>? params) async {
    return await dio.get(path, queryParameters: params);
  }
  
}
