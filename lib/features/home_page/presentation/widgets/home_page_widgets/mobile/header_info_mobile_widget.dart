import 'package:flutter/material.dart';
import 'package:my_porfolio/global/utils/constants.dart';
import 'package:my_porfolio/global/utils/icon_broken.dart';

class HeaderInfoMobileWidget extends StatelessWidget {
  const HeaderInfoMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_literals_to_create_immutables
    return Column(children: [
      ListTile(
        title: Text('ALAA AHMAD ALI AL AYATIM',
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  fontSize: AppConstants.unitHeightValue(context) * 0,
                )),
        leading: const Icon(IconBroken.Profile),
      ),
      const ListTile(
        title: Text('FLUTTER DEVELOPER'),
        leading: Icon(IconBroken.Work),
      ),
    ]);
  }
}
