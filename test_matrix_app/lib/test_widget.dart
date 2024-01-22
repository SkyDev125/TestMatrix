import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Display an image and some text centered underneath it
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Image 'images/test_icon.png' with anti-aliasing (bicubic resampling)
        Image(
          image: AssetImage('images/test_icon.png'),
          filterQuality: FilterQuality.medium,
          isAntiAlias: true,
          width: 100,
          height: 100,
        ),
        Text(
          'Flutter',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
