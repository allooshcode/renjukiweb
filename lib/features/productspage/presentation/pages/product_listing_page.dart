import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_details_page.dart';
import 'product_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductListingPage extends StatelessWidget {
  final ProductBloc productBloc;

  ProductListingPage({required this.productBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        bloc: productBloc,
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoadedState) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  title: Text(product.name),
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
            return Center(child: Text('Error fetching products'));
          } else {
            return Container(); // Placeholder or empty state
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productBloc.add(FetchProductsEvent());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  final ProductBloc productBloc;

  ProductDetailsPage({required this.product, required this.productBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          Text('Product Name: ${product.name}'),
          Text('Product Description: ${product.description}'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // No need to fetch product details again, as we have already loaded them
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
