// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news_tab.dart';
import 'profile_tab.dart';
import 'settings_tab.dart';
import 'songs_tab.dart';
import 'widgets.dart';

void main() => runApp(const MyAdaptingApp());
// The main() function is the entry point of the app.
// It calls the runApp() function with an instance of the MyAdaptingApp widget.
class MyAdaptingApp extends StatelessWidget {
  const MyAdaptingApp({super.key});
//The MyAdaptingApp widget is a StatelessWidget that represents the entire application.
// It configures the app's title, theme, dark theme, and home page.
// It also wraps the app with a CupertinoTheme to provide a different theme for Cupertino (iOS) widgets.

  @override
  Widget build(context) {
    // Either Material or Cupertino widgets work in either Material or Cupertino
    // Apps.
    return MaterialApp(
      title: 'Adaptive Music App',
      theme: ThemeData(
        // Use the green theme for Material widgets.
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      builder: (context, child) {
        return CupertinoTheme(
          // Instead of letting Cupertino widgets auto-adapt to the Material
          // theme (which is green), this app will use a different theme
          // for Cupertino (which is blue by default).
          data: const CupertinoThemeData(),
          child: Material(child: child),
        );
      },
      home: const PlatformAdaptingHomePage(),
    );
  }
}

// Shows a different type of scaffold depending on the platform.
// The PlatformAdaptingHomePage widget is a StatefulWidget that represents the home page of the app.
// It adapts its UI based on the platform.
class PlatformAdaptingHomePage extends StatefulWidget {
  const PlatformAdaptingHomePage({super.key});

  @override
  State<PlatformAdaptingHomePage> createState() =>
      _PlatformAdaptingHomePageState();
}

class _PlatformAdaptingHomePageState extends State<PlatformAdaptingHomePage> {
  int _currentIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  // This app keeps a global key for the songs tab because it owns a bunch of
  // data. Since changing platform re-parents those tabs into different
  // scaffolds, keeping a global key to it lets this app keep that tab's data as
  // the platform toggles.
  // In the _PlatformAdaptingHomePageState class, there are two private methods:
  // _buildAndroidHomePage and _buildIosHomePage.
  //  These methods return the UI for Android and iOS platforms, respectively.
  //
  // This isn't needed for apps that doesn't toggle platforms while running.
  // final songsTabKey = GlobalKey();

  // In Material, this app uses the hamburger menu paradigm and flatly lists
  // all 4 possible tabs. This drawer is injected into the songs tab which is
  // actually building the scaffold around the drawer.

  Widget _buildAndroidHomePage(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          NewsTab(),
          SongsTab(), // Add other pages here
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        selectedIndex: _currentIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.explore), label: 'News'),
          NavigationDestination(icon: Icon(Icons.shuffle_on), label: 'Songs'),
          NavigationDestination(icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }

  // Widget _buildAndroidHomePage(BuildContext context) {
  //   return SongsTab(
  //     // key: songsTabKey,
  //     androidDrawer: _AndroidDrawer(),
  //
  //   );
  // }

  // On iOS, the app uses a bottom tab paradigm. Here, each tab view sits inside
  // a tab in the tab scaffold. The tab scaffold also positions the tab bar
  // in a row at the bottom.
  //
  // An important thing to note is that while a Material Drawer can display a
  // large number of items, a tab bar cannot. To illustrate one way of adjusting
  // for this, the app folds its fourth tab (the settings page) into the
  // third tab. This is a common pattern on iOS.
  // Widget _buildIosHomePage(BuildContext context) {
  //   return CupertinoTabScaffold(
  //     tabBar: CupertinoTabBar(
  //       items: const [
  //         BottomNavigationBarItem(
  //           label: SongsTab.title,
  //           icon: SongsTab.iosIcon,
  //         ),
  //         BottomNavigationBarItem(
  //           label: NewsTab.title,
  //           icon: NewsTab.iosIcon,
  //         ),
  //         BottomNavigationBarItem(
  //           label: ProfileTab.title,
  //           icon: ProfileTab.iosIcon,
  //         ),
  //       ],
  //     ),
  //     tabBuilder: (context, index) {
  //       assert(index <= 2 && index >= 0, 'Unexpected tab index: $index');
  //       return switch (index) {
  //         0 => CupertinoTabView(
  //           defaultTitle: SongsTab.title,
  //           builder: (context) => SongsTab(key: songsTabKey),
  //         ),
  //         1 => CupertinoTabView(
  //           defaultTitle: NewsTab.title,
  //           builder: (context) => const NewsTab(),
  //         ),
  //         2 => CupertinoTabView(
  //           defaultTitle: ProfileTab.title,
  //           builder: (context) => const ProfileTab(),
  //         ),
  //         _ => const SizedBox.shrink(),
  //       };
  //     },
  //   );
  // }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroidHomePage,
    );
  }
}



class _AndroidDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.green),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Icon(
                Icons.account_circle,
                color: Colors.green.shade800,
                size: 96,
              ),
            ),
          ),
          ListTile(
            leading: SongsTab.androidIcon,
            title: const Text(SongsTab.title),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: NewsTab.androidIcon,
            title: const Text(NewsTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => const NewsTab()));
            },
          ),
          ListTile(
            leading: ProfileTab.androidIcon,
            title: const Text(ProfileTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => const ProfileTab()));
            },
          ),
          // Long drawer contents are often segmented.
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          ListTile(
            leading: SettingsTab.androidIcon,
            title: const Text(SettingsTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => const SettingsTab()));
            },
          ),
        ],
      ),
    );
  }
}