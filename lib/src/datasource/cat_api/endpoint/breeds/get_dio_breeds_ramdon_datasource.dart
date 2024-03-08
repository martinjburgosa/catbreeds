import '../../../../common/types.dart';
import '../../../common/sources/dio/dio_source.dart';
import '../../common/cat_api_path.dart';
import '../../dto/cat_api_ds_request.dart';
import '../../dto/cat_breed_info_ds_dto.dart';

class GetDioRamdonBreedsDatasource
    extends GetDio<CatApiDsRequest, List<CatBreedInfoDsDto>> {
  GetDioRamdonBreedsDatasource({
    required super.dio,
  }) : super.expectingJsonArray(
          path: DioPath(CatApiPath.breeds),
          resultDecoder: CatBreedInfoDsDto.listFromJson,
          requestEncoder: CatApiDsRequest.toJson,
        );

  FutureResult<List<CatBreedInfoDsDto>?> getCatBreeds(
      CatApiDsRequest? request) {
    return get(request);
  }
}
