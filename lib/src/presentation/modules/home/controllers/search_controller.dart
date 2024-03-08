import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/dtos/cat_breed_info_dto.dart';

part 'search_controller.g.dart';

@Riverpod(keepAlive: true)
class SearchCatsController extends _$SearchCatsController {
  @override
  List<CatBreedInfoDto> build() {
    return [];
  }

  void setSearchResult(List<CatBreedInfoDto> catList) => state = catList;
}
