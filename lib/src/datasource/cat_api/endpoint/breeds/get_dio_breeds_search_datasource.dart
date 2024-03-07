import '../../../../common/types.dart';
import '../../../common/sources/dio/dio_source.dart';
import '../../common/cat_api_path.dart';
import '../../dto/cat_api_ds_request.dart';
import '../../dto/cat_info_ds_dto.dart';

class GetDioBreedSearchDatasource
    extends GetDio<CatApiDsRequest, List<CatInfoDsDto>> {
  GetDioBreedSearchDatasource({
    required super.dio,
  }) : super.expectingJsonArray(
          path: DioPath('${CatApiPath.breeds}${CatApiPath.search}'),
          resultDecoder: CatInfoDsDto.listFromJson,
          requestEncoder: CatApiDsRequest.toJson,
        );

  FutureResult<List<CatInfoDsDto>?> getBreedByName(CatApiDsRequest? request) {
    return get(request);
  }
}
