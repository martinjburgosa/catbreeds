import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/dtos/cat_breed_info_dto.dart';
import 'controllers/home_controller.dart';
import 'delegates/search_cats_delegate.dart';
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
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CatSearchDelegate(theme, ref),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
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
    final screenSize = MediaQuery.of(context).size;

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // The user has scrolled to the end of the list. Make a new query here.
        ref.read(homeControllerProvider.notifier).loadMoreCatBreeds();
      }
    });

    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.builder(
          padding: EdgeInsets.all(screenSize.width * 0.05),
          controller: scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: screenSize.width * 0.05,
            mainAxisSpacing: screenSize.height * 0.05,
            crossAxisCount: (orientation == Orientation.portrait) ? 1 : 2,
            childAspectRatio: 1.3, // Adjust this value as needed
          ),
          itemCount: catBreedsInfo.length + 1,
          itemBuilder: (context, index) {
            if (index == catBreedsInfo.length) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return CustomCardInformation(catBreedInfo: catBreedsInfo[index]);
            }
          },
        );
      },
    );
  }
}
