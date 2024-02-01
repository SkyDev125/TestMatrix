import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_matrix_app/app_state.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    // Scrollable list of favourited items
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: ListView.builder(
        itemCount: appState.favourites.length,
        itemBuilder: (context, index) {
          var wordPair = appState.favourites[index];
          return ListTile(
            title: Text(wordPair.asPascalCase),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                appState.removeFavourite(wordPair);
              },
            ),
          );
        },
      ),
    );
  }
}
