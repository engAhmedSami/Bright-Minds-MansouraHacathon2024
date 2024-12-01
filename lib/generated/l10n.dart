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

  /// `Welcome to [App Name]`
  String get title1 {
    return Intl.message(
      'Welcome to [App Name]',
      name: 'title1',
      desc: 'Title for the first onboarding page',
      args: [],
    );
  }

  /// `Your ultimate platform to grow your skills, find opportunities, and elevate your career.`
  String get subtitle1 {
    return Intl.message(
      'Your ultimate platform to grow your skills, find opportunities, and elevate your career.',
      name: 'subtitle1',
      desc: 'Subtitle for the first onboarding page',
      args: [],
    );
  }

  /// `Learn What Matters`
  String get title2 {
    return Intl.message(
      'Learn What Matters',
      name: 'title2',
      desc: 'Title for the second onboarding page',
      args: [],
    );
  }

  /// `Access courses tailored to technical and non-technical fields. Gain hands-on experience in design, video editing, voice-over, and more.`
  String get subtitle2 {
    return Intl.message(
      'Access courses tailored to technical and non-technical fields. Gain hands-on experience in design, video editing, voice-over, and more.',
      name: 'subtitle2',
      desc: 'Subtitle for the second onboarding page',
      args: [],
    );
  }

  /// `Explore Jobs & Competitions`
  String get title3 {
    return Intl.message(
      'Explore Jobs & Competitions',
      name: 'title3',
      desc: 'Title for the third onboarding page',
      args: [],
    );
  }

  /// `Discover job opportunities, internships, and freelancing gigs. Join hackathons,competitions,and exclusive events.`
  String get subtitle3 {
    return Intl.message(
      'Discover job opportunities, internships, and freelancing gigs. Join hackathons,competitions,and exclusive events.',
      name: 'subtitle3',
      desc: 'Subtitle for the third onboarding page',
      args: [],
    );
  }

  /// `Shape Your Future`
  String get title4 {
    return Intl.message(
      'Shape Your Future',
      name: 'title4',
      desc: 'Title for the fourth onboarding page',
      args: [],
    );
  }

  /// `Build a professional profile to showcase your skills.Let our AI recommend tailored learning paths and job opportunities for you`
  String get subtitle4 {
    return Intl.message(
      'Build a professional profile to showcase your skills.Let our AI recommend tailored learning paths and job opportunities for you',
      name: 'subtitle4',
      desc: 'Subtitle for the fourth onboarding page',
      args: [],
    );
  }

  /// `Get Started`
  String get GetStarted {
    return Intl.message(
      'Get Started',
      name: 'GetStarted',
      desc: 'Call to action button',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message(
      'Skip',
      name: 'Skip',
      desc: 'Skip button',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: 'splash Screen',
      args: [],
    );
  }

  /// `Sign Up`
  String get SignUp {
    return Intl.message(
      'Sign Up',
      name: 'SignUp',
      desc: 'حساب جديد ف الابلكيشن',
      args: [],
    );
  }

  /// `Sign in`
  String get Signin {
    return Intl.message(
      'Sign in',
      name: 'Signin',
      desc: 'حساب جديد ف الابلكيشن',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: 'تسجيل الدخول ف الابلكيشن',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get Welcome {
    return Intl.message(
      'Welcome Back!',
      name: 'Welcome',
      desc: '  Welcome Back!',
      args: [],
    );
  }

  /// `Let’s login for explore continues`
  String get Lets {
    return Intl.message(
      'Let’s login for explore continues',
      name: 'Lets',
      desc: 'Let’s login for explore continues',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: 'Email',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: 'Password',
      args: [],
    );
  }

  /// `Remember me`
  String get Remember {
    return Intl.message(
      'Remember me',
      name: 'Remember',
      desc: 'Remember me',
      args: [],
    );
  }

  /// `Don't have an account ?`
  String get Donothave {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'Donothave',
      desc: 'Don\'t have an account ?',
      args: [],
    );
  }

  /// `Create an account`
  String get Create {
    return Intl.message(
      'Create an account',
      name: 'Create',
      desc: 'Create an account',
      args: [],
    );
  }

  /// `or continue with `
  String get continuewith {
    return Intl.message(
      'or continue with ',
      name: 'continuewith',
      desc: 'or continue with ',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get ForgetPassword {
    return Intl.message(
      'Forget Password ?',
      name: 'ForgetPassword',
      desc: 'Forget Password ?',
      args: [],
    );
  }

  /// `Create your account`
  String get Createyouraccount {
    return Intl.message(
      'Create your account',
      name: 'Createyouraccount',
      desc: 'Create your account',
      args: [],
    );
  }

  /// `Register now to create a new account`
  String get Register {
    return Intl.message(
      'Register now to create a new account',
      name: 'Register',
      desc: 'Register now to create a new account',
      args: [],
    );
  }

  /// `Full Name`
  String get FullName {
    return Intl.message(
      'Full Name',
      name: 'FullName',
      desc: 'Placeholder text for the full name field',
      args: [],
    );
  }

  /// `Confirm Password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'ConfirmPassword',
      desc: 'Label for the confirm password field',
      args: [],
    );
  }

  /// `I agree to the Terms and Conditions`
  String get TermsAndCondition {
    return Intl.message(
      'I agree to the Terms and Conditions',
      name: 'TermsAndCondition',
      desc: 'Checkbox label for accepting terms and conditions',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get PasswordMismatch {
    return Intl.message(
      'Passwords do not match',
      name: 'PasswordMismatch',
      desc: 'Error message for password mismatch',
      args: [],
    );
  }

  /// `Already have an account?`
  String get AlreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'AlreadyHaveAccount',
      desc: 'Text prompting user if they already have an account',
      args: [],
    );
  }

  /// `By creating an account, you agree to `
  String get AgreeToTerms {
    return Intl.message(
      'By creating an account, you agree to ',
      name: 'AgreeToTerms',
      desc: 'Text indicating agreement to terms',
      args: [],
    );
  }

  /// `the terms `
  String get Terms {
    return Intl.message(
      'the terms ',
      name: 'Terms',
      desc: 'Text indicating agreement to terms',
      args: [],
    );
  }

  /// `and conditions of our policy`
  String get TermsAndConditions {
    return Intl.message(
      'and conditions of our policy',
      name: 'TermsAndConditions',
      desc: 'Text indicating terms and conditions',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
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
