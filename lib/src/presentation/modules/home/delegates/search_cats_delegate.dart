import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/home_controller.dart';
import '../controllers/search_controller.dart';
import '../local_widgets/custom_card_information.dart';

class CatSearchDelegate extends SearchDelegate<String> {
  CatSearchDelegate(
    this.theme,
    this.ref,
  ) : super(
          searchFieldStyle: theme.textTheme.headlineSmall,
        );

  final WidgetRef ref;
  final ThemeData theme;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    ref.read(homeControllerProvider.notifier).searchCatBreedsByName(query);

    return Consumer(
      builder: (context, ref, child) {
        final searchResult = ref.watch(searchCatsControllerProvider);

        if (searchResult.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: ListView(
                children: searchResult
                    .map((cat) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomCardInformation(catBreedInfo: cat)))
                    .toList()),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
