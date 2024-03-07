import 'package:flutter/material.dart';

import '../../../../application/dtos/cat_info_dto.dart';

class CustomCardInformation extends StatelessWidget {
  const CustomCardInformation({
    required this.catInfo,
    super.key,
  });

  final CatInfoDto catInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          Row(
            children: [
              Text(catInfo.name),
              const Text('Mas...'),
            ],
          ),
          Image.network(catInfo.imageUrl),
          Row(
            children: [
              Text(catInfo.origin),
              Text(catInfo.temperament),
            ],
          ),
        ],
      ),
    );
  }
}
