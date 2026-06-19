import 'dart:convert';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:mini_catalog_sp/data_models/product_data_model.dart';
import 'package:mini_catalog_sp/pages/products_page/util/product_card.dart';
import 'package:mini_catalog_sp/pages/util/app_header.dart';
import 'package:mini_catalog_sp/pages/util/empty_page_text.dart';
import 'package:mini_catalog_sp/theme/app_theme.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final data = await fetchData();
    if (!mounted) return;
    setState(() {
      products = data;
      isLoading = false;
    });
  }

  Future<List<Product>> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse("https://fakestoreapi.com/products"),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode != 200) throw Exception('${response.statusCode}');
      return (jsonDecode(response.body) as List<dynamic>)
          .map((item) => Product.fromJson(item))
          .toList();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Ürünler Yüklenemedi: $e"), backgroundColor: AppColors.fail),
        );
      }
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeader.productPage(),
          Image.network("https://wantapi.com/assets/banner.png"),
          if (isLoading)
            const Expanded(child: Center(child: CircularProgressIndicator()))
          else if (products.isEmpty)
            Expanded(child: Center(child: EmptyPageText.productPage()))
          else
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) => ProductCard(product: products[index]),
                ),
              ),
            ),
        ],
      ),
    );
  }
}