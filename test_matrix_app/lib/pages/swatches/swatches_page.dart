import 'package:flutter/material.dart';

import 'widgets/swatches.dart';

class SwatchesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SelectionArea(child: Swatches()),
    );
  }
}
