import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MyAppState extends ChangeNotifier {
  var _currentWordPair = WordPair.random();
  WordPair get currentWordPair => _currentWordPair;

  var favourites = <WordPair>[];

  var player = AssetsAudioPlayer.newPlayer();

  void refreshWordPair() {
    _currentWordPair = WordPair.random();
    notifyListeners();
  }

  void play() {
    player.open(
      Audio("assets/audio/click_effect.mp3"),
      volume: 0.2,
      autoStart: true,
      showNotification: true,
    );
  }

  void toggleFavourite() {
    if (favourites.contains(_currentWordPair)) {
      favourites.remove(_currentWordPair);
    } else {
      favourites.add(_currentWordPair);
    }
    notifyListeners();
  }

  void removeFavourite(WordPair wordPair) {
    favourites.remove(wordPair);
    notifyListeners();
  }
}
