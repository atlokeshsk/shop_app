import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart Details',
          style: textTheme.headlineLarge,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final cart = cartProvider.carts[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cart['imageUrl'] as String),
              radius: 50,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: colorScheme.error,
              ),
              onPressed: () => cartProvider.deleteProduct(cart),
            ),
            title: Text(
              cart['title'] as String,
              style: textTheme.titleLarge,
            ),
            subtitle: Text(
              '${cart['price'] as double}',
              style: textTheme.titleMedium,
            ),
          );
        },
        itemCount: cartProvider.carts.length,
      ),
    );
  }
}
