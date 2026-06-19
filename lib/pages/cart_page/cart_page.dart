import 'package:flutter/material.dart';
import 'package:mini_catalog_sp/pages/cart_page/util/cart_item_card.dart';
import 'package:mini_catalog_sp/pages/util/empty_page_text.dart';
import 'package:mini_catalog_sp/theme/app_theme.dart';
import '../../data_models/product_data_model.dart';

Map<Product, int> cart = {};

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get totalPrice => cart.entries.fold(0, (sum, e) => sum + e.key.price * e.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const BackButton(),
                      const Text("Sepet", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      if (cart.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text("${cart.values.fold(0, (a, b) => a + b)} ürün",
                              style: TextStyle(fontSize: 13, color: AppColors.secondary.withAlpha(120))),
                        ),
                    ],
                  ),
                  if (cart.isNotEmpty)
                    IconButton(
                      onPressed: () {
                        setState(() => cart.clear());
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: const Text("Sepet Temizlendi!"), backgroundColor: AppColors.fail),
                        );
                      },
                      icon: Icon(Icons.delete_sweep_outlined, color: AppColors.fail),
                    ),
                ],
              ),
              const Divider(),
              cart.isEmpty
                  ? Expanded(child: Center(child: EmptyPageText.cart()))
                  : Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 8,
                    childAspectRatio: 3.5,
                  ),
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final entry = cart.entries.elementAt(index);
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: CartItemCard(
                        product: entry.key,
                        quantity: entry.value,
                        onChanged: () => setState(() {}),
                      ),
                    );
                  },
                ),
              ),
              if (cart.isNotEmpty) ...[
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Toplam", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      Text("\$${totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: cart.isEmpty
                    ? () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text("Sepetiniz boş!"), backgroundColor: AppColors.fail),
                )
                    : () {
                  setState(() => cart.clear());
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Siparişiniz alındı!"), backgroundColor: AppColors.success),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: cart.isEmpty ? AppColors.tertiary : AppColors.primary,
                  foregroundColor: AppColors.secondary,
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: cart.isEmpty ? 0 : 4,
                ),
                child: const Text("Ödeme Yap",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}