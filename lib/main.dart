//import 'package:errandboy/home.dart';
import 'package:errandboy/login.dart';
import 'package:errandboy/onboard/onboard.dart';
import 'package:errandboy/settings/app_localizations.dart';
// import 'package:errandboy/theme/theme_constants.dart';
// import 'package:errandboy/theme/theme_manager.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');

  runApp(const MyApp());
}

// ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: lightTheme,
      // darkTheme: darkTheme,
      // themeMode: _themeManager.themeMode,
      title: "Home Screen",
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        //class that loads translations from JSON file
        AppLocalizations.delegate,

        //built in localization for basic text for material widgets
        GlobalMaterialLocalizations.delegate,

        //built in localization for text direction
        GlobalWidgetsLocalizations.delegate,
      ],

      //returns a local to be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }

        //if tehere's no supported local return default
        return supportedLocales.first;
      },
      home: isViewed != 0 ? const Onboard() : const Login(),
    );
  }
}
