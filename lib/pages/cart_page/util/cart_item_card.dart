import 'package:flutter/material.dart';
import 'package:mini_catalog_sp/pages/cart_page/cart_page.dart';
import 'package:mini_catalog_sp/pages/product_view_page/product_view_page.dart';
import 'package:mini_catalog_sp/theme/app_theme.dart';
import '../../../data_models/product_data_model.dart';

class CartItemCard extends StatelessWidget {
  final Product product;
  final int quantity;
  final VoidCallback onChanged;

  const CartItemCard({super.key, required this.product, required this.quantity, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (_) => ProductViewPage(product: product))),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Image.network(product.image, fit: BoxFit.contain),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title, maxLines: 2, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                  Text(product.description, maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: AppColors.secondary.withAlpha(80), fontSize: 10)),
                  Text("\$${product.price} X $quantity = \$${(product.price * quantity).toStringAsFixed(2)}",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  if (quantity <= 1) {
                    cart.remove(product);
                  } else {
                    cart[product] = quantity - 1;
                  }
                  onChanged();
                },
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text("$quantity", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              IconButton(
                onPressed: () {
                  cart[product] = quantity + 1;
                  onChanged();
                },
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
        ],
      ),
    );
  }
}