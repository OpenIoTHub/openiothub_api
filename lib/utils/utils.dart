import 'package:openiothub_constants/openiothub_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

String getOneUUID() {
  var uuid = new Uuid();
  return uuid.v4();
}

Future<String> getJWT() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(SharedPreferencesKey.USER_TOKEN_KEY);
}
