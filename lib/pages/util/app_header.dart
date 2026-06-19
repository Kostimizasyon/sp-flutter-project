import 'package:flutter/material.dart';
import 'package:mini_catalog_sp/theme/app_theme.dart';
import '../cart_page/cart_button.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final String? shortDesc;

  const AppHeader({super.key, required this.title, this.shortDesc});
  const AppHeader.homepage({super.key}) : title = "Ana Sayfa", shortDesc = null;
  const AppHeader.productPage({super.key}) : title = "Ürünler", shortDesc = null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.secondary)),
              if (shortDesc != null)
                Text(shortDesc!, style: TextStyle(fontSize: 11, color: AppColors.secondary.withAlpha(70))),
            ],
          ),
          CartButton(),
        ],
      ),
    );
  }
}