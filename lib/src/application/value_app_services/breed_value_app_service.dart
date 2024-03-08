import '../../common/types.dart';
import '../dtos/cat_breed_info_dto.dart';

abstract class BreedValueAppService {
  FutureResult<List<CatBreedInfoDto>> getRandomBreeds(int? limit, int? page);
  FutureResult<List<CatBreedInfoDto>> getCatBreedsByName(String name);
}
