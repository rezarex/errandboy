import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  //helper method inherited for accessing Localizations
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    //load the languiage JSON file from the 'lang' folder
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  //to be called in every widget that needs localization
  String? translate(String key) {
    return _localizedStrings[key];
  }
}

//localizationsDelegate is a factory for a set of localized resources
//here, the localized strings will be gotten from the Applocalizations objedct

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  //this delegate instance will never change, plus it doesnt have fields
  //it can provide a constant constructor
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // include all the supported language codes
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations is where json loading runs
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
