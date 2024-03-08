import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/presentation/catbreeds_app.dart';
import 'src/presentation/config/themes/default/default_theme_set.dart';
import 'src/presentation/config/themes/theme_resolver.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final defaultTheme = ThemeResolver(
    customer: 'default',
    themeSets: [
      DefaultThemeSet(),
    ],
  ).resolve();

  runApp(
    ProviderScope(
      child: CatbreedsApp(initialTheme: defaultTheme),
    ),
  );
}
