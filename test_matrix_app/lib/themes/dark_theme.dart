import 'package:flutter/material.dart';

var darkTheme = ThemeData.dark().copyWith(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: const Color.fromRGBO(109, 58, 183, 1),
        secondary: const Color.fromARGB(255, 242, 175, 31),
      ),
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: Colors.amberAccent.withOpacity(0.4),
    selectionHandleColor: Colors.amberAccent.withOpacity(0.4),
  ),
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: ThemeData.dark().canvasColor,
        displayColor: ThemeData.dark().canvasColor,
      ),
);
