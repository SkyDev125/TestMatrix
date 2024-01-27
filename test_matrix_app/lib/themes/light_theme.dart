import 'package:flutter/material.dart';

var lightTheme = ThemeData.light().copyWith(
          colorScheme: ThemeData.light().colorScheme.copyWith(
                primary: const Color.fromARGB(255, 152, 104, 223),
                secondary: const Color.fromARGB(255, 255, 204, 101),
              ),
        );