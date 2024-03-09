import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../../application/dtos/cat_breed_info_dto.dart';
import '../../../../common/values/image.dart';
import '../../controllers/detail_controller.dart';
import 'local_widgets/level_indicator.dart';

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
        centerTitle: true,
        title: Text(
          catInfo!.name,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: theme.primaryColor),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _PortraitLayout(
                  screenSize: screenSize,
                  catInfo: catInfo,
                  theme: theme,
                )
              : _LandscapeLayout(
                  screenSize: screenSize,
                  catInfo: catInfo,
                  theme: theme,
                );
        },
      ),
    );
  }
}

class _LandscapeLayout extends StatelessWidget {
  const _LandscapeLayout({
    required this.screenSize,
    required this.catInfo,
    required this.theme,
  });

  final Size screenSize;
  final CatBreedInfoDto catInfo;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _DetailImage(
            imageSize: Size(
              screenSize.width * 0.4,
              screenSize.height * 0.75,
            ),
            catInfo: catInfo,
            theme: theme,
          ),
        ),
        Expanded(
          child: _DetailContent(catInfo: catInfo),
        ),
      ],
    );
  }
}

class _PortraitLayout extends StatelessWidget {
  const _PortraitLayout({
    required this.screenSize,
    required this.catInfo,
    required this.theme,
  });

  final Size screenSize;
  final CatBreedInfoDto catInfo;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _DetailImage(
            imageSize: Size(
              screenSize.width * 0.9,
              screenSize.height * 0.5,
            ),
            catInfo: catInfo,
            theme: theme,
          ),
        ),
        Expanded(
          child: _DetailContent(catInfo: catInfo),
        ),
      ],
    );
  }
}

class _DetailImage extends StatelessWidget {
  const _DetailImage({
    required this.imageSize,
    required this.catInfo,
    required this.theme,
  });

  final Size imageSize;
  final CatBreedInfoDto catInfo;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(imageSize.width * 0.05),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(imageSize.width * 0.10),
          bottomRight: Radius.circular(imageSize.width * 0.25),
        ),
        child: CachedNetworkImage(
          width: imageSize.width,
          height: imageSize.height,
          fit: BoxFit.cover,
          imageUrl: catInfo.imageUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              SizedBox(
            width: imageSize.width * 0.5,
            height: imageSize.height * 0.2,
            child: CircularProgressIndicator(
              color: theme.primaryColor,
              value: downloadProgress.progress,
            ),
          ),
          errorWidget: (context, url, error) => Icon(
            Icons.error,
            size: imageSize.width * 0.5,
            color: Colors.red,
          ),
        ),
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
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: screenSize.height * 0.025),
              child: Text(
                catInfo.description,
                textAlign: TextAlign.justify,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'lbl_detail_origin_country'.tr,
                  style: titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
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
            LevelIndicator(
              title: 'lbl_detail_dog_friendly'.tr,
              level: catInfo.dogFriendly,
            ),
            LevelIndicator(
              title: 'lbl_detail_intelligence'.tr,
              level: catInfo.intelligence,
            ),
            LevelIndicator(
              title: 'lbl_detail_child_friendly'.tr,
              level: catInfo.childFriendly,
            ),
            LevelIndicator(
              title: 'lbl_detail_energy_level'.tr,
              level: catInfo.energyLevel,
            ),
          ],
        ),
      ),
    );
  }
}
