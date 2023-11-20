import 'package:flutter/material.dart';
import 'package:shop_app/widgets/product_card_widget.dart';
import 'package:shop_app/product_data.dart';
import 'package:shop_app/pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final filters = const ['All', 'Addida', 'Puma', 'Nike'];
  late String selectedFilter;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  void changeFilter({required String filter}) {
    setState(() {
      selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
    );

    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //Header
          Row(
            children: [
              //Title
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Shoes\nCollection',
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),
              //Search box
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),

          //Filters
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => changeFilter(filter: filter),
                    child: Chip(
                      labelPadding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 10),
                      backgroundColor:
                          selectedFilter == filter ? colorScheme.primary : null,
                      label: Text(filter),
                    ),
                  ),
                );
              },
              itemCount: filters.length,
            ),
          ),

          // Product list
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 650) {
                  return GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.75),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailsPage(product: product),
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          imageUrl: product['imageUrl'] as String,
                          backgroundColor: index % 2 == 0
                              ? colorScheme.primaryContainer
                              : colorScheme.secondaryContainer,
                          textColor: index % 2 == 0
                              ? colorScheme.onPrimaryContainer
                              : colorScheme.onSecondaryContainer,
                        ),
                      );
                    },
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsPage(product: product),
                          ),
                        );
                      },
                      child: ProductCard(
                        title: product['title'] as String,
                        price: product['price'] as double,
                        imageUrl: product['imageUrl'] as String,
                        backgroundColor: index % 2 == 0
                            ? colorScheme.primaryContainer
                            : colorScheme.secondaryContainer,
                        textColor: index % 2 == 0
                            ? colorScheme.onPrimaryContainer
                            : colorScheme.onSecondaryContainer,
                      ),
                    );
                  },
                  itemCount: products.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
