import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class ApiClient extends GetxService {
  late Dio _dio;

  @override
  onInit() {
    _dio = Dio();
    _dio.options.baseUrl = 'https://fakestoreapi.com';
    _dio.options.connectTimeout = 15000;
    _dio.options.receiveTimeout = 15000;
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    super.onInit();
  }

  Future<Response> get(String path, Map<String, dynamic>? params) async {
    return await _dio.get(path, queryParameters: params);
  }
}
