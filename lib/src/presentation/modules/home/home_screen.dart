import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/dtos/cat_breed_info_dto.dart';
import 'controllers/home_controller.dart';
import 'local_widgets/custom_card_information.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final catBreeds = ref.watch(homeControllerProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.primaryColor,
          centerTitle: true,
          title: Text(
            'lbl_layout_title'.tr,
            style: theme.textTheme.titleMedium,
          ),
        ),
        body: catBreeds.when(
          data: (catBreeds) => _HomeContent(catBreedsInfo: catBreeds),
          error: (error, _) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class _HomeContent extends ConsumerWidget {
  const _HomeContent({
    required this.catBreedsInfo,
  });

  final List<CatBreedInfoDto> catBreedsInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // The user has scrolled to the end of the list. Make a new query here.
        ref.read(homeControllerProvider.notifier).loadMoreCatBreeds();
      }
    });

    return ListView.builder(
      controller: scrollController,
      itemCount: catBreedsInfo.length + 1,
      itemBuilder: (context, index) {
        if (index == catBreedsInfo.length) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: CustomCardInformation(catInfo: catBreedsInfo[index]),
          );
        }
      },
    );
  }
}
