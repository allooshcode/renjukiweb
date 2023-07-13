import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/features/productspage/domain/entity/product_entity.dart';

import '../bloc/product_bloc.dart';
import '../bloc/product_events.dart';
import '../bloc/product_state.dart';


class ProductListingPage extends StatelessWidget {
  final ProductBloc productBloc;

  const ProductListingPage({super.key, required this.productBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        bloc: productBloc,
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoadedState) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  title: Text(product.productName),
                  subtitle: Text(product.description),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                          product: product,
                          productBloc: productBloc,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is ProductErrorState) {
            return const Center(child: Text('Error fetching products'));
          } else {
            return Container(); // Placeholder or empty state
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productBloc.add(FetchProductsEvent());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final ProductEntity product;
  final ProductBloc productBloc;

  const ProductDetailsPage({super.key, required this.product, required this.productBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Text('Product Name: ${product.productName}'),
          Text('Product Description: ${product.description}'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // No need to fetch product details again, as we have already loaded them
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
