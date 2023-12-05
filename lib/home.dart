//import 'package:errandboy/theme/theme_manager.dart';
import 'package:flutter/material.dart';

import 'settings/app_localizations.dart';

// ThemeManager _themeManager = ThemeManager();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // @override
  // void dispose() {
  //   _themeManager.removeListener(themeListener);
  //   super.dispose();
  // }

  // @override
  // void initState() {
  //   _themeManager.addListener(themeListener);
  //   super.initState();
  // }

  // themeListener() {
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context)!.translate('welcome').toString()),
        // actions: [
        //   Switch(
        //       value: _themeManager.themeMode == ThemeMode.dark,
        //       onChanged: (newValue) {
        //         _themeManager.toggleTheme(newValue);
        //       })
        // ],
      ),
    );
  }
}
