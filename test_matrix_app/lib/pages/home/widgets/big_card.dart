import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.wordPair,
  });

  final WordPair wordPair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.canvasColor,
      fontWeight: FontWeight.bold,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 4.0, bottom: 4.0),
          child: Text(
            wordPair.asLowerCase,
            style: style,
            semanticsLabel: wordPair.asPascalCase,
          )),
    );
  }
}
