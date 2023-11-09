import 'dart:async';
import 'dart:io';
// import 'dart:typed_data';
// //import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_web/image_picker_web.dart';
import 'package:suriashop/providers/Products.dart';
import 'package:suriashop/providers/app_provider.dart';
import 'package:suriashop/providers/categories.dart';
import 'package:suriashop/screens/add_product/components/add_banner.dart';
import 'package:suriashop/screens/add_product/components/add_category.dart';
import 'package:suriashop/screens/add_product/components/add_flavour.dart';
import 'package:suriashop/screens/add_product/components/add_product_image.dart';
import 'package:suriashop/screens/add_product/components/add_size.dart';
import 'package:suriashop/screens/add_product/components/banner_image.dart';
import 'package:suriashop/screens/add_product/components/image_product_view.dart';
import 'package:suriashop/screens/add_product/ui/methods/add_products_methods.dart';
import 'package:suriashop/shared/components/reusable_components.dart';
import 'package:suriashop/widgets/categoryDropDown.dart';
import '../../../models/product.dart';
// import 'package:image_picker_for_web/image_picker_for_web.dart';

class AddProduct extends StatefulWidget {
  static const String AddEdtProduct = 'AddEditProduct';

  const AddProduct({super.key});
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _priceFocus = FocusNode();
  final FocusNode _availabeNode = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();
  final FocusNode _weightNode = FocusNode();
  File? _image;
  File? _banner;
  Uint8List? pickedImageBytes;
  String? bannerUrl;
  Product newProduct = Product(
    price: 0,
    category: 'null',
    description: '',
    availableCount: 0,
    productName: '',
    weight: 1,
  );
  final _keyScaffold = GlobalKey<ScaffoldState>();
  bool bannerLoading = false;
  bool haveDiscount = false;
//flutter run --web-renderer html

  Future _addBannerBrowser() async {
    try {
      final XFile? _imageBytes = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 40,
        maxWidth: 330,
        maxHeight: 330,
      );
      if (_imageBytes != null) {
        setState(() {
          bannerLoading = !bannerLoading;
        });
        await Provider.of<Products>(context, listen: false)
            .uploadBannerBrowser(await _imageBytes.readAsBytes())
            .then((value) {
          setState(() {
            bannerUrl = value;
            bannerLoading = !bannerLoading;
          });
        });
        if (bannerUrl != null) {
          setState(() {});
        }
      }
    } catch (err) {
      showToast(err.toString());
    }
  }

  bool _imageBrowserLoading = false;

  Future _addBrowserPhoto(
    BuildContext context,
  ) async {
    try {
      if (_textNamePorduct!.text.isEmpty) {
        showToast('please add product name');
        return;
      }
      final bytesFromPicker = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 40,
        maxWidth: 330,
        maxHeight: 330,
      );
      if (bytesFromPicker != null) {
        pickedImageBytes = await bytesFromPicker.readAsBytes();
        setState(() {
          _imageBrowserLoading = !_imageBrowserLoading;
        });
        // _image = File('should not be null when save image from browser');
        Provider.of<Products>(context, listen: false)
            .addImageBrowserToStorage(_textNamePorduct!.text, pickedImageBytes!)
            .then((value) {
          _image = null;
          setState(() {
            _imageBrowserLoading = !_imageBrowserLoading;
          });
        });
        _imageChanged = true;
      }

      // setState(() {
      //   print(pickedImageBytes);
      // });
    } catch (err) {
      if (mounted) {
        setState(() {
          _imageBrowserLoading = !_imageBrowserLoading;
        });
      }
      showToast(err.toString());
    }
  }

  Future<File?> _addMobBanner(BuildContext context) async {
    final picker = ImagePicker();

    final _picker = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
      maxWidth: 330,
      maxHeight: 330,
    );

    if (_picker != null) {
      setState(() {
        _banner = File(_picker.path);
        // _imageChanged = true;
      });
    }
    return _banner;
  }

  Future _addImageCamera(
    BuildContext context,
  ) async {
    final picker = ImagePicker();

    final _picker = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 40,
      maxWidth: 330,
      maxHeight: 330,
    );

    if (_picker != null) {
      setState(() {
        _image = File(_picker.path);
        _imageChanged = true;
      });
    }
  }

  Future _addImagePhoto(
    BuildContext context,
  ) async {
    final picker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
      maxHeight: 330,
      maxWidth: 330,
    );

    setState(() {
      if (picker != null) {
        _image = File(picker.path);
        _imageChanged = true;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _availabeNode.dispose();
    _weightNode.dispose();
    _controllerPrice.dispose();
    _controllerFlavour.dispose();
    _controllerSize.dispose();
  }

  late PersistentBottomSheetController _sheetController;

  String selectedCategory = 'Drinks';
  final TextEditingController? _textNamePorduct = TextEditingController();

  final categoryText = TextEditingController();
  final _controllerFlavour = TextEditingController();
  Set<String> _flavours = {};
  final _controllerSize = TextEditingController();
  final _controllerPrice = TextEditingController();
  Set<Map<String, String>> _sizes = {};
  bool _imageChanged = false;
  bool _itemUpdated = false;
  bool isBrowser = false;
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    final Product? _product =
        ModalRoute.of(context)?.settings.arguments as Product?;
    if (_product != null) {
      Provider.of<CategoriesProvider>(context).choosedCategory =
          _product.category;
    }

    if (_product != null) {
      newProduct.productID = _product.productID;
      _itemUpdated = true;
      _textNamePorduct!.text = _product.productName;
      selectedCategory = _product.category;
      // _sizes = _product.sizes.;
      _sizes = {};
      _product.sizes!.forEach((key, value) {
        _sizes.add({key: value});
      });
      _flavours = {};
      for (final element in _product.flavours!) {
        _flavours.add(element);
      }

      _image = File('');
      Provider.of<Products>(context, listen: false).imageUrl =
          Provider.of<Products>(context, listen: false).imageUrl ??
              _product.imageUrl;
      if ((defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS) &&
          !kIsWeb) {
        isBrowser = false;
      } else {
        isBrowser = true;
      }
    }
    return Scaffold(
      key: _keyScaffold,
      appBar: AppBar(
        actions: [
          AddBanner(
            banner: _banner,
            addBannerBrowser: _addBannerBrowser,
            addMobBanner: _addMobBanner,
          ),
          if (Provider.of<AppProvider>(
            context,
          ).isLoading)
            const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            )
          else
            TextButton.icon(
              onPressed: () {
                final _isValid = _formKey.currentState!.validate();
                if (!_isValid) {
                  return;
                }
                _formKey.currentState!.save();
                AddProductMethods.saveProduct(
                  context: context,
                  image: _image,
                  pickedImageBytes: pickedImageBytes,
                  newProduct: newProduct,
                  flavours: _flavours,
                  imageChanged: _imageChanged,
                  itemUpdated: _itemUpdated,
                  isBrowser: isBrowser,
                  keyScaffold: _keyScaffold,
                  sizesSet: _sizes,
                  formKey: _formKey,
                );
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
        title: const Text('add product'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _textNamePorduct,
                    // initialValue: newProduct.productName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter a title';
                      }
                    },
                    onSaved: (value) {
                      newProduct = Product(
                        weight: newProduct.weight,
                        productID: newProduct.productID,
                        productName: value!,
                        price: newProduct.price,
                        description: newProduct.description,
                        category: newProduct.category,
                        availableCount: newProduct.availableCount,
                        imageUrl: newProduct.imageUrl,
                        favorite: newProduct.favorite,
                        featured: newProduct.featured,
                        sale: newProduct.sale,
                      );
                    },
                    decoration: const InputDecoration(
                      labelText: 'product name',
                    ),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_priceFocus);
                    },
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue:
                              _product != null ? _product.price.toString() : '',
                          decoration: const InputDecoration(
                            labelText: 'price',
                          ),
                          onSaved: (value) {
                            newProduct = Product(
                              weight: newProduct.weight,
                              productID: newProduct.productID,
                              productName: newProduct.productName,
                              price: double.parse(value!),
                              description: newProduct.description,
                              category: newProduct.category,
                              availableCount: newProduct.availableCount,
                              imageUrl: newProduct.imageUrl,
                              favorite: newProduct.favorite,
                              featured: newProduct.featured,
                              sale: newProduct.sale,
                            );
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'empty value';
                            }
                            // if (double.tryParse(value) <= 0) {
                            //   return 'invaled value';
                            // }
                          },

                          keyboardType: TextInputType.number,
                          focusNode: _priceFocus,
                          textInputAction: TextInputAction.next,

                          //textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_descriptionFocus);
                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Switch.adaptive(
                            onChanged: (bool value) {
                              setState(() {
                                haveDiscount = value;
                                newProduct = Product(
                                  weight: newProduct.weight,
                                  productID: newProduct.productID,
                                  productName: newProduct.productName,
                                  price: newProduct.price,
                                  description: newProduct.description,
                                  category: newProduct.category,
                                  availableCount: newProduct.availableCount,
                                  imageUrl: newProduct.imageUrl,
                                  favorite: newProduct.favorite,
                                  featured: newProduct.featured,
                                  sale: value,
                                  offer: newProduct.offer,
                                );
                              });
                            },
                            value: haveDiscount,
                          ),
                          const Text(
                            'Add Discount',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      if (haveDiscount)
                        Expanded(
                          child: TextFormField(
                            initialValue: _product != null
                                ? _product.offer.toString()
                                : '',
                            decoration: const InputDecoration(
                              labelText: 'Amount of Discount',
                              hintText: ' 1.50 ',
                            ),
                            onSaved: (value) {
                              newProduct = Product(
                                weight: newProduct.weight,
                                productID: newProduct.productID,
                                productName: newProduct.productName,
                                price: newProduct.price,
                                description: newProduct.description,
                                category: newProduct.category,
                                availableCount: newProduct.availableCount,
                                imageUrl: newProduct.imageUrl,
                                favorite: newProduct.favorite,
                                featured: newProduct.featured,
                                sale: newProduct.sale,
                                offer: double.parse(value!),
                              );
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'empty value';
                              }
                              // if (double.tryParse(value) <= 0) {
                              //   return 'invaled value';
                              // }
                            },

                            keyboardType: TextInputType.number,
                            // focusNode: _priceFocus,
                            textInputAction: TextInputAction.next,

                            //textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_descriptionFocus);
                            },
                          ),
                        ),
                    ],
                  ),
                  TextFormField(
                    initialValue: _product != null ? _product.description : '',
                    validator: (value) {
                      if (value!.length < 20) {
                        return 'not enough info';
                      }
                    },
                    onSaved: (value) {
                      newProduct = Product(
                        weight: newProduct.weight,
                        productID: newProduct.productID,
                        productName: newProduct.productName,
                        availableCount: newProduct.availableCount,
                        description: value!,
                        category: newProduct.category,
                        price: newProduct.price,
                        sale: newProduct.sale,
                        featured: newProduct.featured,
                        favorite: newProduct.favorite,
                      );
                    },
                    decoration: const InputDecoration(
                      labelText: 'add Description',
                    ),
                    focusNode: _descriptionFocus,
                    maxLines: 3,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_availabeNode);
                    },
                  ),
                  TextFormField(
                    initialValue: _product != null
                        ? _product.availableCount.toString()
                        : '',
                    decoration:
                        const InputDecoration(labelText: 'how many available?'),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    focusNode: _availabeNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_weightNode);
                    },
                    onSaved: (value) {
                      newProduct = Product(
                        weight: newProduct.weight,
                        productID: newProduct.productID,
                        productName: newProduct.productName,
                        price: newProduct.price,
                        description: newProduct.description,
                        category: newProduct.category,
                        availableCount: int.parse(value!),
                        imageUrl: newProduct.imageUrl,
                        favorite: newProduct.favorite,
                        featured: newProduct.featured,
                        sale: newProduct.sale,
                      );
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'empty value';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    initialValue:
                        _product != null ? _product.weight.toString() : '',
                    focusNode: _weightNode,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'please input the weight of Item';
                      }
                      if (double.parse(value) > 16) {
                        return 'value too big..';
                      }
                    },
                    onSaved: (value) {
                      newProduct = Product(
                        weight: double.parse(value!),
                        productID: newProduct.productID,
                        productName: newProduct.productName,
                        price: newProduct.price,
                        description: newProduct.description,
                        category: newProduct.category,
                        availableCount: newProduct.availableCount,
                        imageUrl: newProduct.imageUrl,
                        favorite: newProduct.favorite,
                        featured: newProduct.featured,
                        sale: newProduct.sale,
                      );
                    },
                    decoration: const InputDecoration(
                      labelText: 'Weight..',
                      hintText: '0.3kg',
                      // border: OutlineInputBorder(),
                    ),
                  ),
                  BannerImage(
                    banner: _banner,
                    bannerUrl: bannerUrl,
                    bannerLoading: bannerLoading,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ImageProductView(
                              image: _image,
                              product: _product,
                            ),
                            if (_imageBrowserLoading)
                              const CircularProgressIndicator()
                          ],
                        ),
                        AddProductImage(
                          addBrowserPhoto: _addBrowserPhoto,
                          addImageCamera: _addImageCamera,
                          addImagePhoto: _addImagePhoto,
                        ),
                        SizedBox(width: _media.width * 0.1),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _addFlavour();
                      });
                    },
                    child: const Text(
                      'Add Flavour',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () => _addCategory(),
                        child: const Text('Add new category'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  // _addDrop(context),
                  const CategoryDropDown(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () => _addSize(),
                        child: const Text('Add Size'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _validate(String? value, {String? warning1, String? warning2}) {
    if (value!.isEmpty) {
      return warning1;
    }
    if (double.parse(value) > 16) {
      return warning2;
    }
  }

  Future<void> _addCategory() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => AddCategory(
        categoryText: categoryText,
        keyScaffold: _keyScaffold,
      ),
    );
  }

  void _addFlavour() {
    _sheetController = _keyScaffold.currentState!.showBottomSheet(
      (context) => AddFlavour(
        controllerFlavour: _controllerFlavour,
        flavours: _flavours,
        sheetController: _sheetController,
      ),
    );
    // return showModalBottomSheet(
    //   context: context,
    //   builder: (context) =>
    // );
  }

  _addSize() {
    _sheetController = _keyScaffold.currentState!.showBottomSheet(
      (context) => AddSize(
        sheetController: _sheetController,
        controllerPrice: _controllerPrice,
        controllerSize: _controllerSize,
        sizes: _sizes,
      ),
    );
    // return showModalBottomSheet(
    //   context: context,
    //   builder: (context) =>
    // );
  }
}
