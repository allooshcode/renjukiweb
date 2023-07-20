import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/features/homepage/presentation/bloc/home_bloc/home_bloc.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../../../../global/app_theme/app_styles.dart';
import '../../../../../../global/shared_widgets/reusable_components.dart';

class BottomFooterInfo extends StatelessWidget {
  const BottomFooterInfo({Key? key}) : super(key: key);

  void launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      launchUrl(
        url,
      );
    } else {
      throw "couldn't open $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: const Color.fromARGB(255, 9, 4, 165),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  'RENJUKI FOR TRADE AND IMPORT SDN HBD',
                  style: AppStyles.getStyleOpen(context, color: Colors.white),
                ),
                Text(
                  ' رنجوكي للاستيراد والتصدير',
                  style: AppStyles.getStyleOpen(context, color: Colors.white),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'no.035-08 jalan imbi,Perjaya Time Squire, 55100 kuala lumpur, Malaysia',
                  style:AppStyles.getStyleOpen(context, color: Colors.white),
                ),
                Text(
                  'Email: INFO@RENJUKI.COM, SALES@RENJUKI.COM',
                  style: AppStyles.getStyleOpen(context, color: Colors.white),
                ),
                Text(
                  'Tel: +60 11 6415 5716 - +60 1185 8713',
                  style: AppStyles.getStyleOpen(context, color: Colors.white),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Follow Us',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                customTextButton(
                    context,
                    () => context.read<HomeBloc>().add(const FaceBookCallEvent()),
                    'FaceBook',
                    color: Colors.white,
                    border: false),
                customTextButton(
                    context,
                    () => launchUrl('https://www.instagram.com/renjuki/?hl=en'),
                    'Instagram',
                    color: Colors.white,
                    border: false),

              ],
            ),
          )
        ],
      ),
    );
  }
}
