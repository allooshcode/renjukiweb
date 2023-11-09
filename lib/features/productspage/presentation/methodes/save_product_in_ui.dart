import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:suriashop/models/product.dart';
import 'package:suriashop/providers/Products.dart';
import 'package:suriashop/providers/app_provider.dart';
import 'package:suriashop/providers/categories.dart';
import 'package:suriashop/providers/userprovider.dart';
import 'package:suriashop/screens/add_product/ui/add_product.dart';
import 'package:suriashop/shared/components/reusable_components.dart';

class AddProductMethods {
  static void saveProduct(
      {required BuildContext context,
      required File? image,
      required Uint8List? pickedImageBytes,
      required Product newProduct,
      required Set<String> flavours,
      required bool imageChanged,
      required bool itemUpdated,
      required bool isBrowser,
      required GlobalKey<ScaffoldState> keyScaffold,
      required Set<Map<String, String>> sizesSet,
      required GlobalKey<FormState> formKey}) async {
    Map<String, String> sizes = {};
    if (sizesSet.isNotEmpty) {
      sizesSet.forEach((element) {
        sizes.putIfAbsent(element.keys.first, () => element.values.first);
      });
    }
    // print(sizes);
    // return;
    FocusScope.of(context).unfocus();

    if (image == null && pickedImageBytes == null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          'No Images Added',
          textAlign: TextAlign.center,
        ),
      ));

      return;
    }
    // return;
    else {
      //
      formKey.currentState!.save();

      Provider.of<AppProvider>(context, listen: false).changeIsLoading();

      try {
        newProduct.category =
            Provider.of<CategoriesProvider>(context, listen: false)
                .choosedCategory;
        newProduct.flavours = flavours.toList();
        newProduct.sizes = sizes;
        // newProduct.sizes = _sizes.map((e) => e.keys.toList()[0]).toList();
        if (Provider.of<UserProvider>(context, listen: false)
            .userModel!
            .isAdmin) {
          await Provider.of<Products>(context, listen: false)
              .addProduct(
                  newProduct, image, imageChanged, itemUpdated, isBrowser)
              .then((value) {
            Provider.of<AppProvider>(context, listen: false).changeIsLoading();
            // setState(() {});

            return showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      content: Text('product added, thank you'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK'),
                        )
                      ],
                    ));
          });
          // _formKey.currentState.reset();
          Navigator.pop(context); // pop current page
          Navigator.pushNamed(context, AddProduct.AddEdtProduct);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Sorry Not Authorized'),
          ));
          return;
        }
        // _formKey.currentState.reset();
      } on FirebaseAuthException catch (err) {
        Provider.of<AppProvider>(context, listen: false).changeIsLoading();

        showDialogSuccess(context, err);
        // Scaffold.of(context).showSnackBar(SnackBar(
        //   content: Text(err.toString()),
        //   backgroundColor: Theme.of(context).errorColor,
        // ));
      } on PlatformException catch (err) {
        Provider.of<AppProvider>(context, listen: false).changeIsLoading();

        showDialogSuccess(context, err);
      } catch (err) {
        Provider.of<AppProvider>(context, listen: false).changeIsLoading();

        showDialogSuccess(context, err);
      }
    }
  }
}
