import 'package:flutter/material.dart';
import 'package:mini_catalog_sp/data_models/product_data_model.dart';
import 'package:mini_catalog_sp/pages/product_view_page/product_view_page.dart';
import 'package:mini_catalog_sp/theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductViewPage(product: product))),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.network(product.image, fit: BoxFit.contain),
                ),
              ),
              const SizedBox(height: 6),
              Text(product.title, maxLines: 2, overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.secondary)),
              const SizedBox(height: 4),
              Text("\$${product.price.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primary)),
            ],
          ),
        ),
      ),
    );
  }
}