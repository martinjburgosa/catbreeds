import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import 'common/sources/dio/dio_factory.dart';

abstract class DioContextDatasourceFactory {
  const DioContextDatasourceFactory({
    required this.dioFactory,
  });

  final DioFactory dioFactory;

  @nonVirtual
  Dio createDio() => dioFactory.create();
}
