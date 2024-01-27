import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../global_widgets/clipboard_toast.dart';

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
      fontWeight: FontWeight.bold,
    );

    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: wordPair.asLowerCase));
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ClipboardToast(context: context, theme: theme).show();
      },
      child: Card(
        color: theme.colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 4.0, bottom: 4.0),
          child: Text(
            wordPair.asLowerCase,
            style: style,
            semanticsLabel: wordPair.asPascalCase,
          ),
        ),
      ),
    );
  }
}
