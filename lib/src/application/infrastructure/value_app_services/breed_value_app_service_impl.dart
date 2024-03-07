import 'dart:core';

import '../../../common/types.dart';
import '../../../datasource/cat_api.dart';
import '../../dtos/cat_info_dto.dart';
import '../../value_app_services/breed_value_app_service.dart';

class BreedValueAppServiceImpl implements BreedValueAppService {
  const BreedValueAppServiceImpl({
    required GetDioBreedSearchDatasource searchBreedDatasource,
    required GetDioBreedsRamdonDatasource getRandomBreedsDatasource,
  })  : _getRandomBreedsDatasource = getRandomBreedsDatasource,
        _searchBreedDatasource = searchBreedDatasource;

  final GetDioBreedSearchDatasource _searchBreedDatasource;
  final GetDioBreedsRamdonDatasource _getRandomBreedsDatasource;

  @override
  FutureResult<List<CatInfoDto>> getCatBreedsByName(String name) async {
    final request = CatApiDsRequest(q: name);

    final result = await _searchBreedDatasource.getBreedByName(request);

    return result.when(
      onValue: (list) => _parseListCatInfoDs(list),
      onFailure: (failure) => ResultExt.failure(failure),
    );
  }

  @override
  FutureResult<List<CatInfoDto>> getRandomBreeds(int? limit) async {
    final request = CatApiDsRequest(limit: limit);

    final result = await _getRandomBreedsDatasource.getCatBreeds(request);

    return result.when(
      onValue: (list) => _parseListCatInfoDs(list),
      onFailure: (failure) => ResultExt.failure(failure),
    );
  }

  List<CatInfoDto> _parseListCatInfoDs(List<CatInfoDsDto> dsList) {
    return dsList.map((e) => CatInfoDto.fromJson(e.toJson())).toList();
  }
}
