import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Display an image and some text centered underneath it
    return const Image(
      image: AssetImage('assets/images/test_icon.png'),
      filterQuality: FilterQuality.high,
      isAntiAlias: true,
      width: 215,
      height: 215,
    );
  }
}
