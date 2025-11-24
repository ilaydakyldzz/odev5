import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/product_detail_page.dart';
import 'screens/cart_page.dart';
import 'screens/not_found_page.dart';
import 'models/product_model.dart';

void main() {
  runApp(const ProductCatalogApp());
}

class ProductCatalogApp extends StatelessWidget {
  const ProductCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Makyaj Dünyası',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE57373),
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/detail': (context) => const ProductDetailPage(),
        '/cart': (context) => const CartPage(),
      },
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name ?? '');
        
        if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'product') {
          var id = int.tryParse(uri.pathSegments[1]);
          if (id != null) {
            try {
              final product = mockProducts.firstWhere((p) => p.id == id);
              return MaterialPageRoute(
                builder: (context) => ProductDetailPage(preloadedProduct: product),
                settings: settings,
              );
            } catch (e) {
              return null;
            }
          }
        }
        return null;
      },
      onUnknownRoute: (settings) {
        debugPrint('Bilinmeyen rota denemesi: ${settings.name}');
        return MaterialPageRoute(
          builder: (context) => NotFoundPage(routeName: settings.name),
        );
      },
    );
  }
}