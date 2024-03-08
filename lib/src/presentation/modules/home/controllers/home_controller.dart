import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/dtos/cat_breed_info_dto.dart';
import '../../../../common/types.dart';
import '../../../providers/aplication/value_app_service_provider.dart';
import 'search_controller.dart';

part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class PageController extends _$PageController {
  @override
  int build() => 0;

  void increment() {
    state++;
  }
}

@riverpod
class HomeController extends _$HomeController {
  @override
  Future<List<CatBreedInfoDto>> build() async {
    final breedsService = ref.watch(breedValueAppServiceProvider);

    final result = await breedsService.getRandomBreeds(
        10, ref.watch(pageControllerProvider));

    return result.when(
      onValue: (list) => list,
      onFailure: (failure) => AsyncError(failure, StackTrace.current),
    );
  }

  Future<void> searchCatBreedsByName(String name) async {
    final breedService = ref.watch(breedValueAppServiceProvider);

    final result = await breedService.getCatBreedsByName(name);

    result.when(
      onValue: (list) {
        ref.read(searchCatsControllerProvider.notifier).setSearchResult(list);
      },
      onFailure: (failure) => AsyncError(failure, StackTrace.current),
    );
  }

  Future<void> loadMoreCatBreeds() async {
    final breedService = ref.watch(breedValueAppServiceProvider);

    final page = ref.watch(pageControllerProvider);

    final result = await breedService.getRandomBreeds(10, page);

    return result.when(
      onValue: (list) {
        ref.read(pageControllerProvider.notifier).increment();
        final currentList = state.value;
        currentList!.addAll(list);
        state = AsyncValue.data(currentList);
      },
      onFailure: (failure) => AsyncError(failure, StackTrace.current),
    );
  }
}
