import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'test_widget.dart';
import 'app_state.dart';
import 'favourite_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        themeMode: ThemeMode.system,
        theme: ThemeData.light().copyWith(
          colorScheme: ThemeData.light().colorScheme.copyWith(
                primary: const Color.fromARGB(255, 152, 104, 223),
                secondary: const Color.fromARGB(255, 255, 204, 101),
              ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: ThemeData.dark().colorScheme.copyWith(
                primary: const Color.fromRGBO(109, 58, 183, 1),
                secondary: const Color.fromARGB(255, 242, 175, 31),
              ),
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
                FavouriteButton(appState: appState, wordPair: wordPair, theme: theme),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          appState.refreshWordPair();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

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
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 4.0, bottom: 4.0),
          child: Text(
            wordPair.asLowerCase,
            style: style,
            semanticsLabel: wordPair.asPascalCase,
          )),
    );
  }
}
