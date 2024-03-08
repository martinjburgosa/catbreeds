import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../delegates/search_cats_delegate.dart';

class CustomSearchBar extends ConsumerWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 30,
      ),
      child: TextField(
        onTap: () {
          showSearch(
            context: context,
            delegate: CatSearchDelegate(theme, ref),
            query: '',
          );
        },
        decoration: const InputDecoration(
          labelText: 'lbl',
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
