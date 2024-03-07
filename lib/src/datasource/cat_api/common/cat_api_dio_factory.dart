import 'package:dio/dio.dart';

import '../../common/sources/dio/dio_factory.dart';

class CatApiDioFactory implements DioFactory {
  CatApiDioFactory({
    required this.host,
    this.connectTimeoutMillis = 60000,
    this.receiveTimeoutMillis = 60000,
  });

  final String host;
  final int connectTimeoutMillis;
  final int receiveTimeoutMillis;

  @override
  Dio create() {
    return Dio(
      BaseOptions(
        baseUrl: host,
        headers: {
          'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39',
          'Content-Type': 'application/json',
        },
        connectTimeout: Duration(milliseconds: connectTimeoutMillis),
        receiveTimeout: Duration(milliseconds: receiveTimeoutMillis),
        contentType: Headers.jsonContentType,
      ),
    );
  }
}
