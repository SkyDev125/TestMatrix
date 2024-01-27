import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_matrix_app/global_widgets/clipboard_toast.dart';

class Swatches extends StatelessWidget {
  const Swatches({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // List of all color properties in ThemeData
    final themeProperties = <String, Color>{
      'canvasColor': theme.canvasColor,
      'cardColor': theme.cardColor,
      'dialogBackgroundColor': theme.dialogBackgroundColor,
      'disabledColor': theme.disabledColor,
      'dividerColor': theme.dividerColor,
      'focusColor': theme.focusColor,
      'highlightColor': theme.highlightColor,
      'hintColor': theme.hintColor,
      'hoverColor': theme.hoverColor,
      'indicatorColor': theme.indicatorColor,
      'primaryColor': theme.primaryColor,
      'primaryColorDark': theme.primaryColorDark,
      'primaryColorLight': theme.primaryColorLight,
      'scaffoldBackgroundColor': theme.scaffoldBackgroundColor,
      'secondaryHeaderColor': theme.secondaryHeaderColor,
      'shadowColor': theme.shadowColor,
      'splashColor': theme.splashColor,
      'unselectedWidgetColor': theme.unselectedWidgetColor,
      // Add more properties if needed
    };

    return GridView.count(
      crossAxisCount: 5,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      scrollDirection: Axis.vertical,
      children: themeProperties.entries.map((entry) {
        return GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: entry.key.toString()));
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ClipboardToast(context: context, theme: theme).show();
          },
          child: Container(
            color: entry.value,
            child: SwatchText(text: entry.key),
          ),
        );
      }).toList(),
    );
  }
}

class SwatchText extends StatelessWidget {
  const SwatchText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Card(
            color: Colors.white.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 4.0, bottom: 4.0),
              child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
            ),
          ),
        ],
      ),
    );
  }
}
