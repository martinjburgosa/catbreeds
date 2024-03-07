import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'local_widgets/custom_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.canvasColor,
          title: Text('lbl_layout_title'.tr),
        ),
        body: const Column(
          children: [
            CustomSearchBar(),
          ],
        ),
      ),
    );
  }
}
