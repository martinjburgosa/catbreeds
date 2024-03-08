import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/infrastructure/value_app_services/breed_value_app_service_impl.dart';
import '../../../application/value_app_services/breed_value_app_service.dart';
import '../datasource/datasource_providers.dart';

part 'value_app_service_provider.g.dart';

@riverpod
BreedValueAppService breedValueAppService(BreedValueAppServiceRef ref) {
  final searchBreedDatasource = ref.watch(searchBreedDatasourceProvider);
  final randomBreedsDatasource = ref.watch(randomBreedsDatasourceProvider);

  return BreedValueAppServiceImpl(
    searchBreedDatasource: searchBreedDatasource,
    getRandomBreedsDatasource: randomBreedsDatasource,
  );
}
