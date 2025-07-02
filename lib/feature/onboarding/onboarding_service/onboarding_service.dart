import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {

static late SharedPreferences pref;

static initShaerdpreferencesStorage() async{
  pref =await SharedPreferences.getInstance();
  return pref;
}
static bool isFirstTime() {
  bool isFirstTime = pref.getBool('isFirstTime') ?? true;
  return isFirstTime;
}

static setFirstTimeWithFalse() {
  pref.setBool('isFirstTime', false);
}

static setFirstTimeWithTrue() {
  pref.setBool('isFirstTime', true);
}

}