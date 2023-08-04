import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:renjuki2/features/homepage/presentation/widgets/location_photo.dart';
import 'package:renjuki2/features/productspage/domain/entity/product_entity.dart';
import 'package:renjuki2/features/productspage/presentation/pages/mobile/product_mobile_build.dart';
import 'package:renjuki2/features/productspage/presentation/pages/web/product_web_build.dart';
import 'package:renjuki2/global/shared_widgets/responser_widget.dart';
import 'package:renjuki2/global/utils/constants.dart';

import '../bloc/product_bloc.dart';
import '../bloc/product_events.dart';
import '../bloc/product_state.dart';

class ProductListingPage extends StatelessWidget {
  final ProductBloc productBloc;

  const ProductListingPage({super.key, required this.productBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      bloc: productBloc,
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoadedState) {
          return ResponserWidget(webWidget: ProductsWebBuild(productList: state.products),
            mobileWidget: ProductsMobileBuild(productList: state.products),);
        } else if (state is ProductErrorState) {
          return const Center(child: Text('Error fetching products'));
        } else {
          return Container(); // Placeholder or empty state
        }
      },
    );
  }
}

