import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../common/types.dart';
import '../../failures/datasource_failures.dart';

part '../../extensions/json_result_decoder.dart';
part '../../types.dart';

abstract class GetDio<IN, OUT> extends _DioSource<IN, OUT> {
  GetDio.expectingJsonObject({
    required super.dio,
    required super.path,
    required super.resultDecoder,
    super.requestEncoder,
    super.errorDecoder,
  }) : super.expectingJsonObject();

  GetDio.expectingJsonArray({
    required super.dio,
    required super.path,
    required super.resultDecoder,
    super.requestEncoder,
    super.errorDecoder,
  }) : super.expectingJsonArray();

  @nonVirtual
  @protected
  FutureResult<OUT?> get([IN? data]) {
    return request(_getCall, data);
  }

  Future<Response> _getCall([
    Map<String, dynamic>? parameters,
    Options? options,
  ]) {
    if (PathEncoderDecoder.createdWithThisEncoder(parameters)) {
      return _dio.get(
        PathEncoderDecoder.decode(_path, parameters),
        options: options,
      );
    } else {
      return _dio.get(
        _path.value,
        queryParameters: parameters,
        options: options,
      );
    }
  }
}

abstract class PostDio<IN, OUT> extends _DioSource<IN, OUT> {
  PostDio.expectingJsonObject({
    required super.dio,
    required super.path,
    required super.requestEncoder,
    required super.resultDecoder,
    super.errorDecoder,
  }) : super.expectingJsonObject();

  PostDio.expectingJsonArray({
    required super.dio,
    required super.path,
    required super.requestEncoder,
    required super.resultDecoder,
    super.errorDecoder,
  }) : super.expectingJsonArray();

  @nonVirtual
  @protected
  FutureResult<OUT?> post(IN data) {
    return request(_postCall, data);
  }

  Future<Response> _postCall([
    Map<String, dynamic>? parameters,
    Options? options,
  ]) {
    if (PathEncoderDecoder.createdWithThisEncoder(parameters)) {
      return _dio.post(
        PathEncoderDecoder.decode(_path, parameters),
        options: options,
      );
    } else {
      return _dio.post(
        _path.value,
        data: parameters,
        options: options,
      );
    }
  }
}

abstract class PutDio<IN, OUT> extends _DioSource<IN, OUT> {
  PutDio.expectingJsonObject({
    required super.dio,
    required super.path,
    required super.requestEncoder,
    required super.resultDecoder,
    super.errorDecoder,
  }) : super.expectingJsonObject();

  PutDio.expectingJsonArray({
    required super.dio,
    required super.path,
    required super.requestEncoder,
    required super.resultDecoder,
    super.errorDecoder,
  }) : super.expectingJsonArray();

  FutureResult<OUT?> put(IN data) {
    return request(_putCall, data);
  }

  Future<Response> _putCall([
    Map<String, dynamic>? parameters,
    Options? options,
  ]) {
    if (PathEncoderDecoder.createdWithThisEncoder(parameters)) {
      return _dio.put(
        PathEncoderDecoder.decode(_path, parameters),
        options: options,
      );
    } else {
      return _dio.put(
        _path.value,
        data: parameters,
        options: options,
      );
    }
  }
}

abstract class DeleteDio<IN, OUT> extends _DioSource<IN, OUT> {
  DeleteDio.expectingJsonObject({
    required super.dio,
    required super.path,
    required super.resultDecoder,
    super.requestEncoder,
    super.errorDecoder,
  }) : super.expectingJsonObject();

  DeleteDio.expectingJsonArray({
    required super.dio,
    required super.path,
    required super.resultDecoder,
    super.requestEncoder,
    super.errorDecoder,
  }) : super.expectingJsonArray();

  @nonVirtual
  @protected
  FutureResult<OUT?> delete([IN? data]) {
    return request(_deleteCall, data);
  }

  Future<Response> _deleteCall([
    Map<String, dynamic>? parameters,
    Options? options,
  ]) {
    if (PathEncoderDecoder.createdWithThisEncoder(parameters)) {
      return _dio.delete(
        PathEncoderDecoder.decode(_path, parameters),
        options: options,
      );
    } else {
      return _dio.delete(
        _path.value,
        data: parameters,
        options: options,
      );
    }
  }
}

abstract class _DioSource<IN, OUT> {
  _DioSource.expectingJsonObject({
    required Dio dio,
    required DioPath path,
    required JsonObjectDecoder<OUT> resultDecoder,
    RequestEncoder<IN>? requestEncoder,
    JsonObjectDecoder<String>? errorDecoder,
  })  : _dio = dio,
        _path = path,
        _requestEncoder = requestEncoder ?? PathEncoderDecoder.encode,
        _resultDecoder = JsonResultDecoderExt.object(resultDecoder),
        _errorDecoder = errorDecoder {
    if (dio.options.baseUrl.isEmpty) {
      throw ArgumentError('You must supply a baseUrl for this DioSource');
    }
  }

  _DioSource.expectingJsonArray({
    required Dio dio,
    required DioPath path,
    required JsonArrayDecoder<OUT> resultDecoder,
    RequestEncoder<IN>? requestEncoder,
    JsonObjectDecoder<String>? errorDecoder,
  })  : _dio = dio,
        _path = path,
        _requestEncoder = requestEncoder ?? PathEncoderDecoder.encode,
        _resultDecoder = JsonResultDecoderExt.array(resultDecoder),
        _errorDecoder = errorDecoder {
    if (dio.options.baseUrl.isEmpty) {
      throw ArgumentError('You must supply a baseUrl for this DioSource');
    }
  }

  final Dio _dio;
  final DioPath _path;
  final RequestEncoder<IN> _requestEncoder;
  final JsonResultDecoder<OUT> _resultDecoder;
  final JsonObjectDecoder<String>? _errorDecoder;

  @protected
  FutureResult<OUT?> request(DioCall dioCall, [IN? data]) async {
    try {
      final response = await dioCall(
        _requestEncoder(data),
      );

      final result = _resultDecoder.when(
        onObject: () => response.data as Map<String, dynamic>,
        onArray: () => response.data as List,
      );
      return ResultExt.value(result);
    } on DioException catch (e) {
      final response = e.response;
      if (response != null) {
        return ResultExt.failure(_resolveFailureForResponse(response, e));
      } else {
        return ResultExt.failure(_getFailure(e));
      }
    }
  }

  ServerFailure _resolveFailureForResponse(
    Response response,
    DioException e,
  ) {
    final int statusCode = response.statusCode!;

    if (statusCode == HttpStatus.unauthorized ||
        statusCode == HttpStatus.forbidden) {
      return UnauthorizedDatasourceFailure(
        _parseErrorMessage(response.data, e),
      );
    }

    return OtherDatasourceFailure(
      _parseErrorMessage(response.data, e),
    );
  }

  String _parseErrorMessage(dynamic responseData, DioException e) {
    if (responseData != null && _errorDecoder != null) {
      if (responseData is Map<String, dynamic>) {
        return _errorDecoder(responseData);
      } else if (responseData is String) {
        return responseData;
      }
    }
    return e.message ?? '';
  }

  /// Gets the concrete failure depending on the [DioException.type].
  ServerFailure _getFailure(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return const CancelDatasourceFailure();
      case DioExceptionType.connectionTimeout:
        return const ConnectTimeoutDatasourceFailure();
      case DioExceptionType.unknown:
        return OtherDatasourceFailure(error.message ?? '');
      case DioExceptionType.receiveTimeout:
        return const ReceiveTimeoutDatasourceFailure();
      case DioExceptionType.badResponse:
        return const ResponseDatasourceFailure();
      case DioExceptionType.sendTimeout:
        return const SendTimeoutDatasourceFailure();
      default:
        return const ServerDatasourceFailure();
    }
  }
}
