import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class EmptyPageText extends StatelessWidget {
  final String content;
  final IconData icon;

  const EmptyPageText({super.key, required this.content, required this.icon});

  const EmptyPageText.cart({super.key}) : content = "Sepetiniz Boş", icon = Icons.shopping_cart_outlined;
  const EmptyPageText.productPage({super.key}) : content = "Ürün Bulunamadı", icon = Icons.inventory_2_outlined;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 72, color: AppColors.secondary.withAlpha(60)),
          const SizedBox(height: 20),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.secondary.withAlpha(140)
            ),
          ),
        ],
      ),
    );
  }
}