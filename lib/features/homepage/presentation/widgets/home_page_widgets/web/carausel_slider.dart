import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:renjuki2/global/utils/constants.dart';

class QarouselSlider extends StatelessWidget {
  const QarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
      items: [AppConstants.photo1, AppConstants.photo2, AppConstants.photo3]
          .map((i) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: PhotoView(imageProvider: NetworkImage(i)),
                ));
          },
        );
      }).toList(),
    );
  }
}
