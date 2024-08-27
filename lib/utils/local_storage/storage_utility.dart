import 'package:get_storage/get_storage.dart';

class SOLocalStorage {
  static final SOLocalStorage _instance = SOLocalStorage();

  factory SOLocalStorage() {
    return _instance;
  }

  SOLocalStorage._internal();

  final _storage = GetStorage();

  // Generic method to save data
  Future<void> saveData<SO>(String key, SO value) async {
    await _storage.write(key, value);
  }

  // Generic Method to Read Data
  SO? readData<SO>(String key) {
    return _storage.read<SO>(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}