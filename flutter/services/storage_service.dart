import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class StorageService {
  static final StorageService _singleton = StorageService._internal();

  factory StorageService() {
    return _singleton;
  }

  StorageService._internal();

  final _box = GetStorage();

  Future<bool> saveData(String key, dynamic value) async {
    try {
      await _box.write(key, value);
      return true;
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }

  Future<bool> writeDataIfNull(String key, dynamic value) async {
    try {
      await _box.writeIfNull(key, value);
      return true;
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }

  getData(String key) {
    return _box.read(key);
  }

  Future<void> removeData(String key) async {
    try {
      await _box.remove(key);
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> clearEverything() async {
    try {
      await _box.erase();
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
