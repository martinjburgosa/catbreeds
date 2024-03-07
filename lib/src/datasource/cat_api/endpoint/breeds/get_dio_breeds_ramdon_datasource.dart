import '../../../../common/types.dart';
import '../../../common/sources/dio/dio_source.dart';
import '../../common/cat_api_path.dart';
import '../../dto/cat_api_ds_request.dart';
import '../../dto/cat_info_ds_dto.dart';

class GetDioBreedsRamdonDatasource
    extends GetDio<CatApiRequest, List<CatInfoDsDto>> {
  GetDioBreedsRamdonDatasource({
    required super.dio,
  }) : super.expectingJsonArray(
          path: DioPath(CatApiPath.breeds),
          resultDecoder: CatInfoDsDto.listFromJson,
          requestEncoder: CatApiRequest.toJson,
        );

  FutureResult<List<CatInfoDsDto>?> getCatBreeds(CatApiRequest? request) {
    return get(request);
  }
}
