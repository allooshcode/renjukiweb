import 'package:flutter/material.dart';
import 'package:renjuki2/global/utils/constants.dart';

class AboutUsPageMobile extends StatelessWidget {
  const AboutUsPageMobile({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Our Company',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Company Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Fusce tristique eros mauris, in rutrum enim varius id. '
              'Phasellus auctor turpis eu tristique luctus.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Duis id scelerisque metus. Integer mattis varius augue, '
              'vel consectetur libero convallis non.',
            ),
            const SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCircularAvatar(
                    'https://firebasestorage.googleapis.com/v0/b/renjuki.appspot.com/o/1.jpeg?alt=media&token=b18feed0-5542-45c5-bcdf-03c1a74c52a4',
                    'Photo 1 Title',
                    'Photo 1 Description',
                    context),
                _buildCircularAvatar(
                    'https://firebasestorage.googleapis.com/v0/b/renjuki.appspot.com/o/3.jpeg?alt=media&token=4dbc6af7-405c-496a-9c05-ecf15a745dc0',
                    'Photo 2 Title',
                    'Photo 2 Description',
                    context),
                _buildCircularAvatar(
                    'https://firebasestorage.googleapis.com/v0/b/renjuki.appspot.com/o/4.jpeg?alt=media&token=b06245fa-f91c-4c5c-b1da-99b09f0f958f',
                    'Photo 3 Title',
                    'Photo 3 Description',
                    context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularAvatar(String imagePath, String title,
      String description, BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: AppConstants.unitWidthValu(context) * 30,
          backgroundColor: Colors.grey,
          foregroundImage: NetworkImage(imagePath),
        ),
        const SizedBox(height: 8.0),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          description,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
