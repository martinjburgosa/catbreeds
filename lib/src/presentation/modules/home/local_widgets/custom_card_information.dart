import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../application/dtos/cat_breed_info_dto.dart';
import '../controllers/detail_controller.dart';

class CustomCardInformation extends ConsumerWidget {
  const CustomCardInformation({
    required this.catBreedInfo,
    super.key,
  });

  final CatBreedInfoDto catBreedInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    final headLineSmall =
        theme.textTheme.headlineSmall!.copyWith(color: Colors.black);
    const circularRadius = Radius.circular(40);
    return InkWell(
      onTap: () => ref
          .read(detailControllerProvider.notifier)
          .setCatInfoToDetailView(catBreedInfo),
      child: Card(
        color: Colors.deepPurple[50],
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    catBreedInfo.name,
                    style: theme.textTheme.headlineMedium,
                  ),
                  Text(
                    'lbl_home_card_more'.tr,
                    style: headLineSmall.copyWith(
                      color: theme.primaryColor,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: circularRadius,
                      bottomRight: circularRadius,
                    ),
                    child: CachedNetworkImage(
                      width: screenSize.width * 0.75,
                      height: screenSize.height * 0.3,
                      fit: BoxFit.cover,
                      imageUrl: catBreedInfo.imageUrl,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => SizedBox(
                        width: screenSize.width * 0.75,
                        height: screenSize.height * 0.3,
                        child: CircularProgressIndicator(
                          color: theme.primaryColor,
                          value: downloadProgress.progress,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        size: 100,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    catBreedInfo.origin,
                    style: headLineSmall,
                  ),
                  SizedBox(width: screenSize.width * 0.035),
                  Flexible(
                    child: Text(
                      catBreedInfo.temperament,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: headLineSmall.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
