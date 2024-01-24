import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var _currentWordPair = WordPair.random();

  WordPair get currentWordPair => _currentWordPair;

  void refreshWordPair() {
    _currentWordPair = WordPair.random();
    notifyListeners();
  }

  var favourites = <WordPair>[];

  void toggleFavourite() {
    if (favourites.contains(_currentWordPair)) {
      favourites.remove(_currentWordPair);
    } else {
      favourites.add(_currentWordPair);
    }
    notifyListeners();
  }
}
