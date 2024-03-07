import '../../common/types.dart';
import '../dtos/cat_info_dto.dart';

abstract class BreedValueAppService {
  FutureResult<List<CatInfoDto>> getRandomBreeds(int? limit);
  FutureResult<List<CatInfoDto>> getCatBreedsByName(String name);
}
