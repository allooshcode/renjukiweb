import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AddCartButtonDetails extends StatelessWidget {
  const AddCartButtonDetails({
    Key? key,
    required this.product,
  })
  // required this.choosedFlavor,
  // required this.choosedSize})
      : super(key: key);

  final Product product;
  // final String choosedFlavor;
  // final String choosedSize;
  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<Products>(context, listen: false);

    final _cart = Provider.of<Cart>(context, listen: false);
    final _lang = Provider.of<LanguageProvider>(context, listen: false);
    final _userID = Provider.of<UserProvider>(
      context,
    ).user().currentUser?.uid;

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
        onPressed: _userID != null
            ? () async {
          try {
            _cart.changeCartLoading();
            await Provider.of<Cart>(context, listen: false)
                .addCartItemAlready(
              product,
              product.quantity,
              _userID,
              _products.chooseSize,
              _products.chooseFlavor,
            )
                .then((value) {
              AwesomeDialog(
                btnOkColor: Theme.of(context).primaryColor,
                // dialogBackgroundColor: Theme.of(context).primaryColor,
                context: context,
                dialogType: DialogType.SUCCES,
                animType: AnimType.BOTTOMSLIDE,
                title: _lang.getText('Successful').toString(),
                btnOkText: _lang.getText('OK').toString(),
                desc: _lang.getText('Item Added to Cart').toString(),
                btnOkOnPress: () {
                  Navigator.of(context).pop();
                },
              ).show();
              // Scaffold.of(context).hideCurrentSnackBar();
              // Scaffold.of(context).showSnackBar(SnackBar(
              //     content:
              //         Text('great! Item added to Cart')));
            });
          } on FirebaseException catch (err) {
            _cart.changeCartLoading();

            AwesomeDialog(
              context: context,
              dialogType: DialogType.INFO,
              animType: AnimType.BOTTOMSLIDE,
              title: _lang.getText('Error').toString(),
              desc: err.toString(),
              btnCancelOnPress: () {},
              btnOkOnPress: () {},
            )..show();
          } catch (err) {
            _cart.changeCartLoading();

            AwesomeDialog(
              context: context,
              dialogType: DialogType.INFO,
              animType: AnimType.BOTTOMSLIDE,
              title: _lang.getText('Error').toString(),
              desc: err.toString(),
              btnCancelOnPress: () {},
              btnOkOnPress: () {},
            )..show();
          }
        }
            : () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            btnOkColor: Theme.of(context).primaryColor,
            btnCancelColor: Theme.of(context).hoverColor,
            title: _lang.getText('SIGN IN').toString(),
            desc: _lang.getText('please sign in first').toString(),
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              Navigator.of(context).pushNamed(SignInScreen.SIGNINSCREEN,
                  arguments: product);
            },
          )..show();
          // Scaffold.of(context).hideCurrentSnackBar();
          // Scaffold.of(context).showSnackBar(SnackBar(
          //     content: Text('please sign in First')));
        },
        child: Provider.of<Cart>(context).cartloading
            ? const CircularProgressIndicator()
            : Text(
          _lang.getText('Add To Cart').toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            // color: Colors.white,
            fontSize: 15,
            fontFamily: 'OpenSans-Bold',
          ),
        ),
      ),
    );
  }
}