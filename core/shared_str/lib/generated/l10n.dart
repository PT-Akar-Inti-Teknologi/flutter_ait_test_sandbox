// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';
import 'package:auth_blocks/auth_blocks.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class SharedStr implements AuthStr {
  SharedStr();

  static SharedStr? _current;

  static SharedStr get current {
    assert(_current != null,
        'No instance of SharedStr was loaded. Try to initialize the SharedStr delegate before accessing SharedStr.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<SharedStr> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = SharedStr();
      SharedStr._current = instance;

      return instance;
    });
  }

  static SharedStr of(BuildContext context) {
    final instance = SharedStr.maybeOf(context);
    assert(instance != null,
        'No instance of SharedStr present in the widget tree. Did you add SharedStr.delegate in localizationsDelegates?');
    return instance!;
  }

  static SharedStr? maybeOf(BuildContext context) {
    return Localizations.of<SharedStr>(context, SharedStr);
  }

  /// `Don't have an account?   `
  String get auth_dont_have_account {
    return Intl.message(
      'Don\'t have an account?   ',
      name: 'auth_dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Register Here`
  String get auth_feat_register_here {
    return Intl.message(
      'Register Here',
      name: 'auth_feat_register_here',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get auth_login {
    return Intl.message(
      'Login',
      name: 'auth_login',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back! Let's login to your account`
  String get auth_welcome_login {
    return Intl.message(
      'Welcome back! Let\'s login to your account',
      name: 'auth_welcome_login',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<SharedStr> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'id', countryCode: 'ID'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<SharedStr> load(Locale locale) => SharedStr.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) => true;
}
