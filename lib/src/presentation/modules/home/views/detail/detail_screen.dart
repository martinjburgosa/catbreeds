import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../../application/dtos/cat_breed_info_dto.dart';
import '../../../../common/values/image.dart';
import '../../controllers/detail_controller.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final catInfo = ref.watch(detailControllerProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          catInfo!.name,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: theme.primaryColor),
        ),
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              bottomRight: Radius.circular(150),
            ), // Adjust the radius as needed
            child: Image.network(
              catInfo.imageUrl,
              width: screenSize.width * 0.9,
              height: screenSize.height * 0.5,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(child: _DetailContent(catInfo: catInfo)),
        ],
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent({
    required this.catInfo,
  });

  final CatBreedInfoDto catInfo;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final titleMedium =
        theme.textTheme.titleMedium!.copyWith(color: Colors.black);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.10,
            vertical: screenSize.height * 0.025),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'lbl_detail_description'.tr,
                style: titleMedium,
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.175,
              child: Text(catInfo.description),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('lbl_detail_origin_country'.tr, style: titleMedium),
                Text(catInfo.origin, style: titleMedium),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('lbl_detail_life_span'.tr, style: titleMedium),
                Text(catInfo.lifeSpan, style: titleMedium),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            _LevelIndicator(
              title: 'lbl_detail_dog_friendly'.tr,
              level: catInfo.dogFriendly,
            ),
            _LevelIndicator(
              title: 'lbl_detail_intelligence'.tr,
              level: catInfo.intelligence,
            ),
            _LevelIndicator(
              title: 'lbl_detail_child_friendly'.tr,
              level: catInfo.childFriendly,
            ),
            _LevelIndicator(
              title: 'lbl_detail_energy_level'.tr,
              level: catInfo.energyLevel,
            ),
          ],
        ),
      ),
    );
  }
}

class _LevelIndicator extends StatelessWidget {
  const _LevelIndicator({
    required this.title,
    required this.level,
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
