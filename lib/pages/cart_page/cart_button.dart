import 'package:flutter/material.dart';
import 'package:mini_catalog_sp/theme/app_theme.dart';
import 'cart_page.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return
        IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage())),
          icon: Icon(Icons.shopping_cart_outlined, color: AppColors.secondary),
        );
  }
}