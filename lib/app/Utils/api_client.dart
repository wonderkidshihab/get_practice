import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData;

class ApiClient extends GetxService {
  static ApiClient to = Get.find();
  Dio dio = Dio();

  Future<ApiClient> init() async {
    dio.options.baseUrl = 'https://fakestoreapi.com/';
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    dio.interceptors.add(LogInterceptor(responseBody: true));
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return this;
  }

  Future get(String url, {Map<String, dynamic>? params}) async {
    try {
      Response response = await dio.get(url, queryParameters: params);
      if (isError(response)) return null;
      return response.data;
    } on DioError catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future post(String url, {Map<String, dynamic>? data}) async {
    try {
      Response response = await dio.post(url, data: data);
      if (isError(response)) return null;
      return response.data;
    } on DioError catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future put(String url, {Map<String, dynamic>? data}) async {
    try {
      Response response = await dio.put(url, data: data);
      if (isError(response)) return null;
      return response.data;
    } on DioError catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future delete(String url, {Map<String, dynamic>? data}) async {
    try {
      Response response = await dio.delete(url, data: data);
      if (isError(response)) return null;
      return response.data;
    } on DioError catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future requestWithFile(String url, {Map<String, dynamic>? data}) async {
    try {
      Response response = await dio.post(url, data: FormData.fromMap(data!));
      if (isError(response)) return null;
      return response.data;
    } on DioError catch (e) {
      log(e.toString());
      return null;
    }
  }

  bool isError(Response response) {
    if (response.statusCode == 200) return false;
    return true;
  }
}
