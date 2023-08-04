import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renjuki2/features/productspage/domain/entity/product_entity.dart';


class AddCartButtonDetails extends StatelessWidget {
  const AddCartButtonDetails({
    Key? key,
    required this.product,
  })

      : super(key: key);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {



    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.only(right: 8, left: 8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * 0.1
          : MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:
        Border.all(color: Colors.blue, width: 2, style: BorderStyle.solid),
      ),
      child: TextButton(
        onPressed: (){
          // Scaffold.of(context).hideCurrentSnackBar();
          // Scaffold.of(context).showSnackBar(SnackBar(
          //     content: Text('please sign in First')));
        },
        child: const Text(
          'Add To Cart',
          textAlign: TextAlign.center,
          style: TextStyle(
            // color: Colors.white,
            fontSize: 15,
            fontFamily: 'OpenSans-Bold',
          ),
        ),
      ),
    );
  }
}