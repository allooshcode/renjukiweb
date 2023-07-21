import 'package:flutter/material.dart';
import 'package:renjuki2/global/utils/constants.dart';

import '../../widgets/location_photo.dart';

class LocationPageWeb extends StatelessWidget {
  const LocationPageWeb({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocationPhoto(
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/renjuki.appspot.com/o/background-image.jpg?alt=media&token=40087107-c0d1-4e93-841f-08e6908c1126',
                  productName: 'EGYPT',
                  description: 'Photo 1 Description',
                ),
                LocationPhoto(
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/renjuki.appspot.com/o/caption.jpg?alt=media&token=ef0e4e9d-ad5e-4c91-b3b4-e791f388de2d',
                  productName: 'JAPAN',
                  description: 'Photo 2 Description',
                ),
                LocationPhoto(
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/renjuki.appspot.com/o/Kuala-Lumpur-on-a-Budget.jpg?alt=media&token=8a50cfbd-a748-4790-935b-2396d5b89950',
                  productName: 'MALAYSIA',
                  description: 'Photo 3 Description',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildCircularAvatar(String imagePath, String title,
  //     String description, BuildContext context) {
  //   return Column(
  //     children: [
  //       Container(
  //         decoration: const BoxDecoration(borderRadius: BorderRadius.all()),
  //         radius: AppConstants.unitWidthValu(context) * 10,
  //         backgroundColor: Colors.grey,
  //         foregroundImage: NetworkImage(imagePath),
  //       ),
  //       const SizedBox(height: 8.0),
  //       Text(
  //         title,
  //         style: const TextStyle(
  //           fontWeight: FontWeight.bold,
  //           fontSize: 16,
  //         ),
  //       ),
  //       const SizedBox(height: 4.0),
  //       Text(
  //         description,
  //         style: const TextStyle(fontSize: 14),
  //       ),
  //     ],
  //   );
  // }
}
