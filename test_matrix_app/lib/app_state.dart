import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MyAppState extends ChangeNotifier {
  var _currentWordPair = WordPair.random();

  var player = AssetsAudioPlayer.newPlayer();

  WordPair get currentWordPair => _currentWordPair;

  void refreshWordPair() {
    _currentWordPair = WordPair.random();
    notifyListeners();
  }

  void play() {
    player.open(
      Audio("assets/audio/song1.mp3"),
      volume: 0.2,
      autoStart: true,
      showNotification: true,
    );
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
