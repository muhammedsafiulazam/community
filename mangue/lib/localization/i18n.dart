// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: public_member_api_docs, prefer_single_quotes, avoid_escaping_inner_quotes, prefer_const_constructors, sort_constructors_first, always_specify_types

import 'dart:async';

import 'package:flutter/widgets.dart';

/// A class generated by flappy_translator package containing localized strings
class I18n {
  static String get mangue => _getText("mangue");

  static String get retry => _getText("retry");

  static String get congratulation => _getText("congratulation");

  static String get sorry => _getText("sorry");

  static String get oops => _getText("oops");

  static String get error => _getText("error");

  static String get settings => _getText("settings");

  static String get ok => _getText("ok");

  static String get cancel => _getText("cancel");

  static String get restart => _getText("restart");

  static String get update => _getText("update");

  static String get save => _getText("save");

  static String get search => _getText("search");

  static String get localization => _getText("localization");

  static String get camera => _getText("camera");

  static String get microphone => _getText("microphone");

  static String get gallery => _getText("gallery");

  static String get storage => _getText("storage");

  static String get notifications => _getText("notifications");

  static String get unknown => _getText("unknown");

  static String get dots => _getText("dots");

  static String get na => _getText("na");

  static String get not_available => _getText("not_available");

  static String get crash => _getText("crash");

  static String get restart_application_message =>
      _getText("restart_application_message");

  static String get error_crash_error_stack =>
      _getText("error_crash_error_stack");

  static late Map<String, String> _localizedValues;

  static const _enValues = {
    "mangue": "Mango",
    "retry": "Retry",
    "congratulation": "Congratulation!",
    "sorry": "Sorry!",
    "oops": "Oops!",
    "error": "Oops! Something went wrong!",
    "settings": "Settings",
    "ok": "Ok",
    "cancel": "Cancel",
    "restart": "Restart",
    "update": "Update",
    "save": "Save",
    "search": "Search",
    "localization": "Localization",
    "camera": "Camera",
    "microphone": "Microphone",
    "gallery": "Gallery",
    "storage": "Storage",
    "notifications": "Notifications",
    "unknown": "Unknown",
    "dots": "...",
    "na": "n/a",
    "not_available": "Not available.",
    "crash": "Crash",
    "restart_application_message":
        "Sorry! Unexpected error occured.\nPlease restart application.",
    "error_crash_error_stack": "Error:\n{error}\n\nStack:\n{stack}",
  };

  static const _frValues = {
    "mangue": "Mangue",
    "retry": "R??essayez",
    "congratulation": "F??licitations!",
    "sorry": "Pardon!",
    "oops": "Oups!",
    "error": "Oups! Quelque chose a mal tourn??!",
    "settings": "R??glages",
    "ok": "D'accord",
    "cancel": "Annuler",
    "restart": "Red??marrer",
    "update": "Mise ?? jour",
    "save": "Sauver",
    "search": "Rechercher",
    "localization": "Localisation",
    "camera": "Cam??ra",
    "microphone": "Microphone",
    "gallery": "Galerie",
    "storage": "Stockage",
    "notifications": "Notifications",
    "unknown": "Inconnue",
    "dots": "...",
    "na": "n/a",
    "not_available": "Indisponible.",
    "crash": "Crash",
    "restart_application_message":
        "D??sol?? ! Une erreur inattendue s'est produite.\nVeuillez relancer l'application.",
    "error_crash_error_stack": "Error:\n{error}\n\nStack:\n{stack}",
  };

  static const _allValues = {
    "en": _enValues,
    "fr": _frValues,
  };

  I18n(Locale locale) {
    _locale = locale;
    _localizedValues = {};
  }

  static late Locale _locale;

  static String _getText(String key) =>
      _localizedValues[key] ?? '** $key not found';

  static Locale get currentLocale => _locale;

  static String get currentLanguage => _locale.languageCode;

  static Future<I18n> load(Locale locale) async {
    final translations = I18n(locale);
    _localizedValues = _allValues[locale.toString()]!;
    return translations;
  }
}

class I18nDelegate extends LocalizationsDelegate<I18n> {
  const I18nDelegate();

  static final Set<Locale> supportedLocals = {
    Locale('en'),
    Locale('fr'),
  };

  @override
  bool isSupported(Locale locale) => supportedLocals.contains(locale);

  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);

  @override
  bool shouldReload(I18nDelegate old) => false;
}
