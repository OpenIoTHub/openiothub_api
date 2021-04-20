import 'package:openiothub_constants/openiothub_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

//获取用户是否已经登录
Future<bool> userSignedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.containsKey(SharedPreferencesKey.USER_TOKEN_KEY);
}
