import 'package:flutter/material.dart';

class ClipboardToast {
  final BuildContext context;
  final ThemeData theme;

  ClipboardToast({required this.context, required this.theme});

  void show() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        showCloseIcon: true,
        width: 200,
        content: Center(
          child: Text(
            'Copied to clipboard',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: theme.secondaryHeaderColor, // Set the background color
        shape: RoundedRectangleBorder(
          // Set the shape
          borderRadius: BorderRadius.circular(15.0), // Round the corners
        ),
        behavior: SnackBarBehavior.floating, // Make the SnackBar float
      ),
    );
  }
}
