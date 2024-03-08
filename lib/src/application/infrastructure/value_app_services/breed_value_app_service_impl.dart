import 'dart:core';

import '../../../common/types.dart';
import '../../../datasource/cat_api.dart';
import '../../dtos/cat_breed_info_dto.dart';
import '../../value_app_services/breed_value_app_service.dart';

class BreedValueAppServiceImpl implements BreedValueAppService {
  const BreedValueAppServiceImpl({
    required GetDioBreedSearchDatasource searchBreedDatasource,
    required GetDioRamdonBreedsDatasource getRandomBreedsDatasource,
  })  : _getRandomBreedsDatasource = getRandomBreedsDatasource,
        _searchBreedDatasource = searchBreedDatasource;

  final GetDioBreedSearchDatasource _searchBreedDatasource;
  final GetDioRamdonBreedsDatasource _getRandomBreedsDatasource;

  @override
  FutureResult<List<CatBreedInfoDto>> getCatBreedsByName(String name) async {
    final request = CatApiDsRequest(q: name);

    final result = await _searchBreedDatasource.getBreedByName(request);

    return result.when(
      onValue: (list) => ResultExt.value(_parseListCatInfoDs(list)),
      onFailure: (failure) => ResultExt.failure(failure),
    );
  }

  @override
  FutureResult<List<CatBreedInfoDto>> getRandomBreeds(
    int? limit,
    int? page,
  ) async {
    final request = CatApiDsRequest(
      limit: limit,
      page: page,
    );

    final result = await _getRandomBreedsDatasource.getCatBreeds(request);

    return result.when(
      onValue: (list) => ResultExt.value(_parseListCatInfoDs(list)),
      onFailure: (failure) => ResultExt.failure(failure),
    );
  }

  List<CatBreedInfoDto> _parseListCatInfoDs(List<CatBreedInfoDsDto> dsList) {
    return dsList.map((e) => CatBreedInfoDto.fromJson(e.toJson())).toList();
  }
}
