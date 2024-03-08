import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/config/datasource_factory/cat_api_datasource_factory.dart';
import '../../../datasource/cat_api.dart';

part 'datasource_providers.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return CatApiContextDatasourceFactory().createDio();
}

@riverpod
GetDioBreedSearchDatasource searchBreedDatasource(
  SearchBreedDatasourceRef ref,
) {
  final dioContext = ref.watch(dioProvider);

  return GetDioBreedSearchDatasource(dio: dioContext);
}

@riverpod
GetDioRamdonBreedsDatasource randomBreedsDatasource(
  RandomBreedsDatasourceRef ref,
) {
  final dioContext = ref.watch(dioProvider);

  return GetDioRamdonBreedsDatasource(dio: dioContext);
}
