// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `borrow`
  String get borrow {
    return Intl.message(
      'borrow',
      name: 'borrow',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Connection failed`
  String get connection_failed {
    return Intl.message(
      'Connection failed',
      name: 'connection_failed',
      desc: '',
      args: [],
    );
  }

  /// `user information`
  String get dialog {
    return Intl.message(
      'user information',
      name: 'dialog',
      desc: '',
      args: [],
    );
  }

  /// `deadline:{time}`
  String deadline(Object time) {
    return Intl.message(
      'deadline:$time',
      name: 'deadline',
      desc: '',
      args: [time],
    );
  }

  /// `change_deadline`
  String get change_deadline {
    return Intl.message(
      'change_deadline',
      name: 'change_deadline',
      desc: '',
      args: [],
    );
  }

  /// `edit`
  String get edit {
    return Intl.message(
      'edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `#kasikari-memo`
  String get hash_tag {
    return Intl.message(
      '#kasikari-memo',
      name: 'hash_tag',
      desc: '',
      args: [],
    );
  }

  /// `kasikari-memo`
  String get title {
    return Intl.message(
      'kasikari-memo',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `logout`
  String get logout {
    return Intl.message(
      'logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `login_register`
  String get login_register {
    return Intl.message(
      'login_register',
      name: 'login_register',
      desc: '',
      args: [],
    );
  }

  /// `login user : {user}`
  String login_user(Object user) {
    return Intl.message(
      'login user : $user',
      name: 'login_user',
      desc: '',
      args: [user],
    );
  }

  /// `limit`
  String get limit {
    return Intl.message(
      'limit',
      name: 'limit',
      desc: '',
      args: [],
    );
  }

  /// `Let's tap the add button to take a note of your lending and borrowing!`
  String get list_no_data {
    return Intl.message(
      'Let`s tap the add button to take a note of your lending and borrowing!',
      name: 'list_no_data',
      desc: '',
      args: [],
    );
  }

  /// `lend`
  String get lend {
    return Intl.message(
      'lend',
      name: 'lend',
      desc: '',
      args: [],
    );
  }

  /// `input_form`
  String get input_form {
    return Intl.message(
      'input_form',
      name: 'input_form',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your loan`
  String get validate_loan {
    return Intl.message(
      'Please enter your loan',
      name: 'validate_loan',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get validate_mail {
    return Intl.message(
      'Please enter your email',
      name: 'validate_mail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get validate_name {
    return Intl.message(
      'Please enter your name',
      name: 'validate_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password`
  String get validate_password_present {
    return Intl.message(
      'Please enter password',
      name: 'validate_password_present',
      desc: '',
      args: [],
    );
  }

  /// `Password requires 6 digit or more`
  String get validate_password_minimum_length {
    return Intl.message(
      'Password requires 6 digit or more',
      name: 'validate_password_minimum_length',
      desc: '',
      args: [],
    );
  }

  /// `Borrow`
  String get registration {
    return Intl.message(
      'Borrow',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Lend`
  String get registration_borrow {
    return Intl.message(
      'Lend',
      name: 'registration_borrow',
      desc: '',
      args: [],
    );
  }

  /// `Things I lend`
  String get registration_lend {
    return Intl.message(
      'Things I lend',
      name: 'registration_lend',
      desc: '',
      args: [],
    );
  }

  /// `Things I borrow`
  String get registration_loan_borrow {
    return Intl.message(
      'Things I borrow',
      name: 'registration_loan_borrow',
      desc: '',
      args: [],
    );
  }

  /// `Things I lend`
  String get registration_loan_lend {
    return Intl.message(
      'Things I lend',
      name: 'registration_loan_lend',
      desc: '',
      args: [],
    );
  }

  /// `From whom`
  String get registration_name_borrow {
    return Intl.message(
      'From whom',
      name: 'registration_name_borrow',
      desc: '',
      args: [],
    );
  }

  /// `To whom`
  String get registration_name_lend {
    return Intl.message(
      'To whom',
      name: 'registration_name_lend',
      desc: '',
      args: [],
    );
  }

  /// `Fail login`
  String get fail_login_firebase {
    return Intl.message(
      'Fail login',
      name: 'fail_login_firebase',
      desc: '',
      args: [],
    );
  }

  /// `Fail logout`
  String get fail_logout_firebase {
    return Intl.message(
      'Fail logout',
      name: 'fail_logout_firebase',
      desc: '',
      args: [],
    );
  }

  /// `Fail registration`
  String get fail_registration_firebase {
    return Intl.message(
      'Fail registration',
      name: 'fail_registration_firebase',
      desc: '',
      args: [],
    );
  }

  /// `Who: {name}`
  String who(Object name) {
    return Intl.message(
      'Who: $name',
      name: 'who',
      desc: '',
      args: [name],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
