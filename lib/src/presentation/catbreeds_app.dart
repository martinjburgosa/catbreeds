import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../application/common/customs/customer_theme.dart';
import 'config/route/pages.dart';
import 'config/route/routes.dart';
import 'config/translation/app_translations.dart';

class CatbreedsApp extends StatelessWidget {
  const CatbreedsApp({
    required this.initialTheme,
    super.key,
  });

  final CustomerTheme initialTheme;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catbreeds',
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('es_CO'),
      initialRoute: Routes.home.value,
      getPages: pages,
      theme: initialTheme.theme,
    );
  }
}
