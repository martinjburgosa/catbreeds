// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pageControllerHash() => r'd699717bc82dea889a3ea75552cb7ae83ef988cf';

/// See also [PageController].
@ProviderFor(PageController)
final pageControllerProvider = NotifierProvider<PageController, int>.internal(
  PageController.new,
  name: r'pageControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pageControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PageController = Notifier<int>;
String _$homeControllerHash() => r'8676cc628d17a667495d2e626bef2794287898d5';

/// See also [HomeController].
@ProviderFor(HomeController)
final homeControllerProvider = AutoDisposeAsyncNotifierProvider<HomeController,
    List<CatBreedInfoDto>>.internal(
  HomeController.new,
  name: r'homeControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeController = AutoDisposeAsyncNotifier<List<CatBreedInfoDto>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
