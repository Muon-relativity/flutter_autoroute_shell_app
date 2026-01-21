
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../router/app_router.dart';

@RoutePage()
class AppShellPage extends StatelessWidget {
  const AppShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        const HomeTabRoute(),
        const SearchTabRoute(),
        const SettingsTabRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            tabsRouter.setActiveIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
