import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Map<String, Object> product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int? _selectedSizeIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
        ),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: textTheme.headlineLarge,
          ),
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              widget.product['imageUrl'] as String,
              height: 250,
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          Container(
            height: 200,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List).length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ChoiceChip(
                          selectedColor: colorScheme.primary,
                          selected: _selectedSizeIndex == index,
                          onSelected: (selected) {
                            setState(() {
                              _selectedSizeIndex = selected ? index : null;
                            });
                          },
                          labelStyle: textTheme.bodyLarge,
                          label: Text(
                              '${(widget.product['sizes'] as List)[index]}'),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addProduct(widget.product);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Product Added')));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50)),
                  child: Text(
                    'Add To Cart',
                    style: textTheme.bodyLarge!
                        .copyWith(color: colorScheme.onPrimary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
