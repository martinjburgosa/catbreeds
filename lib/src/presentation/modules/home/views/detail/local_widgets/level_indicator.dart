import 'package:flutter/material.dart';

import '../../../../../common/values/image.dart';

class LevelIndicator extends StatelessWidget {
  const LevelIndicator({
    required this.title,
    required this.level,
    super.key,
  });

  final String title;
  final int level;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Text(
            title,
            style: theme.textTheme.titleMedium!.copyWith(color: Colors.black),
          ),
        ),
        ...List.generate(level, (index) {
          return ImageIcon(
            AssetImage(PngImage.dogHandFill.value),
            color: theme.primaryColor,
          );
        }),
        ...List.generate(5 - level, (index) {
          return ImageIcon(AssetImage(PngImage.dogHandEmpty.value));
        }),
      ],
    );
  }
}
