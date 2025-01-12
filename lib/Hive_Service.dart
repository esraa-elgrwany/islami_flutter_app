import 'package:hive/hive.dart';

class HiveService {
  static const String settingsBox = 'settings';


  static Future<void> saveSwitchState(String key, bool value) async {
    var box = await Hive.openBox(settingsBox);
    box.put(key, value);
  }

  static Future<bool> getSwitchState(String key) async {
    var box = await Hive.openBox(settingsBox);
    return box.get(key, defaultValue: false);
  }
}
