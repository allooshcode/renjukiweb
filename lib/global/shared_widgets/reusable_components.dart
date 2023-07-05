

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../app_theme/app_styles.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton(
      {Key? key, required this.function, required this.text, this.color})
      : super(key: key);

  final void Function()? function;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      child: MaterialButton(
        color: color ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide.lerp(
            const BorderSide(color: Colors.blue),
            const BorderSide(color: Colors.blue),
            100,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: function,
        child: Text(
            text,          style: AppStyles.getStyleOpen(context, size: 22),
        ),
      ),
    );
  }
}

class CustomElevatedIconButton extends StatelessWidget {
  const CustomElevatedIconButton({
    Key? key,
    required this.function,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final void Function()? function;
  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              // side: BorderSide(color: Colors.red)
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).primaryColor,
          ),
        ),
        icon: icon,
        onPressed: function,
        label: Text(
text,          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

Widget customDivider() {
  return const Divider(
    thickness: 1,
    endIndent: 20,
    indent: 20,
  );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar(
    String text, BuildContext context,  ) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

Future showDialogSuccess(BuildContext context, Object err,
    {bool isErr = true}) {
  if (isErr) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text('something went wrong ${err.toString()}'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Try Again'),
          )
        ],
      ),
    );
  } else {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: const Text('Done Successfully'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }
}

void showToast(String msg, {Color? x}) {
  Fluttertoast.showToast(
    timeInSecForIosWeb: 4,
    webShowClose: true,
    webPosition: 'center',
    backgroundColor: x,
    msg: msg,
    gravity: ToastGravity.TOP,
    toastLength: Toast.LENGTH_LONG,
  );
}

Widget customTextButton(BuildContext context, VoidCallback? function, String text,
    {Color color = Colors.blue, bool border = true}) {
  return Container(
    padding: const EdgeInsets.only(bottom: 14.0),
    width: double.infinity,
    child: TextButton(
      onPressed: () {
        function!();
      },
      style: border
          ? ButtonStyle(
        side: MaterialStateProperty.all(
          BorderSide.lerp(
            const BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
            const BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
            20.0,
          ),
        ),
      )
          : null,
      child: Text(
        text,
        style: AppStyles.getStyleOpen(context, color: color),
      ),
    ),
  );
}