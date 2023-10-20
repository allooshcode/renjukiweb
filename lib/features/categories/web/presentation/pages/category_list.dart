import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/features/categories/web/domain/usecases/category_fetching_usecase.dart';
import 'package:renjuki2/features/categories/web/presentation/bloc/category_bloc.dart';

import '../../../../../container_injection.dart';
import '../widgets/category_listview_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(sl<CategoryFetchingUsecase>())
        ..add(CategoryEventFetch()),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          switch (state) {
            case CategoryLoading():
              return const CircularProgressIndicator();
            case CategoryLoaded():
              return CategoryList(categoriesList: state.categoryList);

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}


//  return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.9,
//       child: Provider.of<CategoriesProvider>(
//         context,
//       ).categoriesList.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.separated(
//               physics: const BouncingScrollPhysics(),
//               itemCount: Provider.of<CategoriesProvider>(
//                 context,
//               ).categoriesList.length,
//               separatorBuilder: (_, i) => const Padding(
//                 padding: EdgeInsets.all(8.0),
//               ),
//               // scrollDirection: Axis.horizontal,
//               itemBuilder: (_, i) => ChangeNotifierProvider.value(
//                 value: Provider.of<CategoriesProvider>(
//                   context,
//                 ).categoriesList[i],
//                 child: const Padding(
//                   padding: EdgeInsetsDirectional.only(start: 8.0),
//                   child: CategoryDisplayW(),
//                 ),
//               ),
//             ),
//     );