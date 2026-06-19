import 'package:flutter/material.dart';
import 'package:mini_catalog_sp/pages/products_page/product_page.dart';
import 'package:mini_catalog_sp/theme/app_theme.dart';

ValueNotifier<int> selectedIndex = ValueNotifier(1);

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.surface,
          error: AppColors.fail,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: AppColors.secondary,
            fontSize: 12,
          ),
        ),
      ),
      home: const ProductPage(),
    );
  }
}