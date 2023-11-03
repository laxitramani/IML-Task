import 'package:get_storage/get_storage.dart';

class LocalStorageKeys {
  static const String placeList = 'placeList';
}

class LocalStorage {
  static GetStorage localStorage = GetStorage();

  static read({required String key}) {
    return localStorage.read(key);
  }

  static void write({required String key, required dynamic data}) {
    localStorage.write(key, data);
  }
}
