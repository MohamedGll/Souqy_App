import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/constants_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@lazySingleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    ));
  }
  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? param,
    Map<String, dynamic>? headers,
  }) async {
    return dio.get(
      AppConstants.baseUrl + endPoint,
      queryParameters: param,
      options: Options(headers: headers),
    );
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    return dio.post(
      AppConstants.baseUrl + endPoint,
      data: body,
      options: Options(headers: headers),
    );
  }
}
