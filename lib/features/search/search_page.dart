
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_autoroute_shell_app/app.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Search Page'),
      ),
      child: Center(
        child: const Text(
          'Welcome to the Search Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
