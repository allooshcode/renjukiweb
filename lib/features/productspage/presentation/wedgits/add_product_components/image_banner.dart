import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  const BannerImage(
      {Key? key,
      required this.banner,
      required this.bannerUrl,
      required this.bannerLoading})
      : super(key: key);

  final File? banner;
  final bool bannerLoading;
  final String? bannerUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(border: Border.all()),
        child: (defaultTargetPlatform == TargetPlatform.android ||
                defaultTargetPlatform == TargetPlatform.iOS)
            ? banner != null
                ? Image.file(banner!)
                : const Text('Banner Image')
            : bannerLoading
                ? const CircularProgressIndicator()
                : bannerUrl != null
                    ? Image.network(bannerUrl!)
                    : const Text('Banner Image'),
      ),
    );
  }
}
