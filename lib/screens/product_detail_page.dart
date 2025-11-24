import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductDetailPage extends StatelessWidget {
  final Product? preloadedProduct;

  const ProductDetailPage({super.key, this.preloadedProduct});

  @override
  Widget build(BuildContext context) {
    Product? product;

    if (preloadedProduct != null) {
      product = preloadedProduct;
    } else {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is Product) {
        product = args;
      }
    }

    if (product == null) {
      return const Scaffold(body: Center(child: Text("Hata: Ürün bulunamadı")));
    }

    final finalProduct = product;

    return Scaffold(
      appBar: AppBar(
        title: Text(finalProduct.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                  tag: 'product-image-${finalProduct.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      finalProduct.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              Text(
                finalProduct.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                '${finalProduct.price} TL',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary, 
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 24),
              
              Text(
                'Ürün Özellikleri',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: finalProduct.description
                    .split(RegExp(r'[,.]\s*'))
                    .where((s) => s.trim().isNotEmpty)
                    .map((feature) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.check_circle_outline, size: 20, color: Colors.green),
                              const SizedBox(width: 12),
                              Expanded(child: Text(feature.trim(), style: Theme.of(context).textTheme.bodyLarge)),
                            ],
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 32),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  label: const Text('Sepete Ekle'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    if (!cartItems.contains(finalProduct)) {
                      cartItems.add(finalProduct);
                    }
                    Navigator.pop(context, '${finalProduct.name} sepete eklendi!');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}