import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_matrix_app/app_state.dart';
import 'widgets/test_widget.dart';
import 'widgets/big_card.dart';
import 'widgets/favourite_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    var wordPair = appState.currentWordPair;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TestWidget(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigCard(wordPair: wordPair),
                const SizedBox(width: 10),
                FavouriteButton(
                  appState: appState,
                  wordPair: wordPair,
                  theme: theme,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          appState.refreshWordPair();
          appState.play();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
