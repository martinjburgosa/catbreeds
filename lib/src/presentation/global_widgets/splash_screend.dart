import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/values/color_set.dart';
import '../common/values/image.dart';
import '../config/route/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.offAndToNamed(Routes.home.value);
    });

    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorSet.white.value,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'lbl_layout_title'.tr,
              style: theme.textTheme.titleMedium,
            ),
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.075),
              child: CircularProgressIndicator(
                color: ColorSet.blackGradient60.value,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenSize.width * 0.075),
              child: Image.asset(
                GifImage.animatedCat.value,
                width: screenSize.width * 0.75,
                height: screenSize.height * 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
