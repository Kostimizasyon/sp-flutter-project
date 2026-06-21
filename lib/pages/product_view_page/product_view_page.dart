import 'package:flutter/material.dart';
import 'package:mini_catalog_sp/data_models/product_data_model.dart';
import 'package:mini_catalog_sp/pages/cart_page/cart_button.dart';
import 'package:mini_catalog_sp/theme/app_theme.dart';
import '../cart_page/cart_page.dart';

class ProductViewPage extends StatelessWidget {
  final Product product;
  const ProductViewPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 16, 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const BackButton(),
                  Text(
                    "Geri",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                  ),
                  const Spacer(),
                  CartButton(),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Image.network(product.image, fit: BoxFit.contain),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(product.title,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.secondary)),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withAlpha(30),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(product.category.toUpperCase(),
                              style: TextStyle(fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text("\$${product.price.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary)),
                        const Spacer(),
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text("${product.rating.rate}",
                            style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.secondary)),
                        const SizedBox(width: 4),
                        Text("(${product.rating.count})",
                            style: TextStyle(fontSize: 12, color: AppColors.secondary.withAlpha(130))),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text("Açıklama",
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.secondary)),
                    const SizedBox(height: 4),
                    Text(product.description,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: AppColors.secondary.withAlpha(150))),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  final inCart = cart[product] ?? 0;
                  cart[product] = inCart + 1;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Sepete Eklendi!"),
                      backgroundColor: AppColors.success,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.secondary,
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sepete Ekle",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "(\$${product.price.toStringAsFixed(2)})",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}