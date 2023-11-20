import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.imageUrl,
      required this.backgroundColor,
      required this.textColor});

  final String title;
  final double price;
  final String imageUrl;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.titleLarge!.copyWith(color: textColor),
            ),
            const SizedBox(height: 5),
            Text(
              '\$$price',
              style: textTheme.titleMedium!.copyWith(color: textColor),
            ),
            const SizedBox(height: 5),
            Center(
              child: Image.asset(
                imageUrl,
                height: 175,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
