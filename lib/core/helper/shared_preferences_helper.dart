import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const _onBoardingKey = 'onBoardingShown';

  // Get the language code (or any other existing method you have)
  static Future<String> getLanguageCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('languageCode') ?? 'en'; // Default to 'en'
  }

  // Save the language code (or any other existing method you have)
  static Future<void> saveLanguageCode(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', languageCode);
  }

  // Check if onboarding has been shown
  static Future<bool> isOnboardingShown() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onBoardingKey) ?? false; // Default to false
  }

  // Mark onboarding as shown
  static Future<void> setOnboardingShown() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_onBoardingKey, true);
  }
}
