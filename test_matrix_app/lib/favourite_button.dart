import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'app_state.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    super.key,
    required this.appState,
    required this.wordPair,
    required this.theme,
  });

  final MyAppState appState;
  final WordPair wordPair;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 35,
      icon: const Icon(Icons.star),
      onPressed: () {
        appState.toggleFavourite();
      },
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(const Size.square(60)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
          backgroundColor: MaterialStateProperty.all<Color>(
              appState.favourites.contains(wordPair)
                  ? theme.colorScheme.secondary
                  : theme.colorScheme.primary),
          foregroundColor: MaterialStateProperty.all<Color>(theme.canvasColor)),
    );
  }
}
