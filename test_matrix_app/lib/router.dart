import 'package:flutter/material.dart';
import 'pages/home/home_page.dart';

class MyRouter extends StatefulWidget {
  @override
  State<MyRouter> createState() => _MyRouterState();
}

class _MyRouterState extends State<MyRouter> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    // Fetch page from selectedIndex

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomePage();

      case 1:
        page = const Placeholder();

      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // Fetch theme from context
    var theme = Theme.of(context);

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              backgroundColor: theme.colorScheme.secondary,
              extended: false,
              destinations: [
                const NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                const NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}
