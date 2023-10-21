import 'package:flutter/material.dart';

class CategoryDisplayW extends StatelessWidget {
  const CategoryDisplayW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context, listen: false);
    final _category = Provider.of<CategoryModel>(context, listen: false);
    final lang = Provider.of<LanguageProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(CategoryItems.categoryItems, arguments: _category)
            .then(
              (value) =>
                  Provider.of<Cart>(context, listen: false).cartloading = false,
            );
      } // Navigator.of(context).pushNamed(ProdcutDetails.productdetails,
      //     arguments: _category.productID);
      // Navigator.push(context, MaterialPageRoute(builder: (_)=>ProdcutDetails()),);
      ,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.40,
        width: MediaQuery.of(context).size.width * 0.40,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                    child: GridTile(
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder:
                            const AssetImage('assets/images/placeholder.jpg'),
                        image: NetworkImage(
                          _category.image,
                          // productsDoc[Product.IMAGEURL],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    // productsDoc[Product.NAME],
                    (lang.getText(_category.name) == null)
                        ? 'New Category'
                        : lang.getText(_category.name).toString(),
                    // _category.name,
                    style: AppStyles.getStyleOpen(
                      context,
                      size: 20,
                      color: Colors.yellowAccent,
                    ),
                    textAlign: TextAlign.center,
                    // overflow: TextOverflow.ellipsis,
                  ),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget _addRemoveItem(BuildContext context, Product product) {
//   return Container(
//     margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 4),
//     decoration: BoxDecoration(
//       color: Colors.lightBlueAccent,
//       borderRadius: BorderRadius.circular(10),
//     ),
//     //padding: EdgeInsets.only(right: 0),
//     width: MediaQuery.of(context).size.width * 0.23,
//     height: MediaQuery.of(context).size.height * 0.18,
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       // crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Expanded(
//           child: IconButton(
//             icon: const Icon(
//               Icons.remove,
//               color: Colors.yellowAccent,
//             ),
//             onPressed: () {
//               product.decrease();
//             },
//           ),
//         ),
//         Text(
//           Provider.of<Product>(context).quantity.toString(),
//           // overflow: TextOverflow.clip,
//           style: const TextStyle(color: Colors.yellowAccent, fontSize: 15),
//           textAlign: TextAlign.right,
//         ),
//         Expanded(
//           child: IconButton(
//             icon: const Icon(
//               Icons.add,
//               color: Colors.yellow,
//             ),
//             onPressed: () {
//               product.increase();
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }