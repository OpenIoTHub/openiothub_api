import 'package:openiothub_constants/openiothub_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getJWT() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(SharedPreferencesKey.USER_TOKEN_KEY);
}
