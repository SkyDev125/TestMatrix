import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'test_widget.dart';

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
        darkTheme: ThemeData.dark(), // This is the default Flutter dark theme
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var _currentWordPair = WordPair.random();

  WordPair get currentWordPair => _currentWordPair;

  void refreshWordPair() {
    _currentWordPair = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TestWidget(),
            const Text('A cute idea:', style: TextStyle(fontSize: 30)),
            Text(appState.currentWordPair.asLowerCase,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
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
