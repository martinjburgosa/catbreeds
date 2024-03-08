// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasource_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'fbc9473d96769fad3533ae5a39ee3a0f4c09c6ff';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$searchBreedDatasourceHash() =>
    r'e0daab35fc961c182056f767d1f74032fd73c299';

/// See also [searchBreedDatasource].
@ProviderFor(searchBreedDatasource)
final searchBreedDatasourceProvider =
    AutoDisposeProvider<GetDioBreedSearchDatasource>.internal(
  searchBreedDatasource,
  name: r'searchBreedDatasourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchBreedDatasourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SearchBreedDatasourceRef
    = AutoDisposeProviderRef<GetDioBreedSearchDatasource>;
String _$randomBreedsDatasourceHash() =>
    r'7ef329abba0243f67285b89861569011fdc28391';

/// See also [randomBreedsDatasource].
@ProviderFor(randomBreedsDatasource)
final randomBreedsDatasourceProvider =
    AutoDisposeProvider<GetDioBreedsRamdonDatasource>.internal(
  randomBreedsDatasource,
  name: r'randomBreedsDatasourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$randomBreedsDatasourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RandomBreedsDatasourceRef
    = AutoDisposeProviderRef<GetDioBreedsRamdonDatasource>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
