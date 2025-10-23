import 'package:hive_ce/hive.dart';

/// Generic Hive utility functions for common operations
class HiveUtils {
  /// Opens a Hive box with the given name and type
  static Future<Box<T>> openBox<T>(String boxName) async {
    try {
      return await Hive.openBox<T>(boxName);
    } catch (e) {
      throw Exception('Failed to open box $boxName: $e');
    }
  }

  /// Closes a Hive box
  static Future<void> closeBox<T>(Box<T> box) async {
    try {
      await box.close();
    } catch (e) {
      throw Exception('Failed to close box: $e');
    }
  }

  /// Gets all values from a box as a list
  static List<T> getAllValues<T>(Box<T> box) {
    try {
      return box.values.toList();
    } catch (e) {
      throw Exception('Failed to get all values: $e');
    }
  }

  /// Gets a value by key from a box
  static T? getValue<T>(Box<T> box, dynamic key) {
    try {
      return box.get(key);
    } catch (e) {
      throw Exception('Failed to get value for key $key: $e');
    }
  }

  /// Adds a value to a box and returns the key
  static Future<dynamic> addValue<T>(Box<T> box, T value) async {
    try {
      final key = await box.add(value);
      await box.flush();
      return key;
    } catch (e) {
      throw Exception('Failed to add value: $e');
    }
  }

  /// Puts a value with a specific key in a box
  static Future<void> putValue<T>(Box<T> box, dynamic key, T value) async {
    try {
      await box.put(key, value);
      await box.flush();
    } catch (e) {
      throw Exception('Failed to put value for key $key: $e');
    }
  }

  /// Updates a value at a specific index in a box
  static Future<void> updateValueAt<T>(Box<T> box, int index, T value) async {
    try {
      await box.putAt(index, value);
      await box.flush();
    } catch (e) {
      throw Exception('Failed to update value at index $index: $e');
    }
  }

  /// Deletes a value by key from a box
  static Future<void> deleteValue<T>(Box<T> box, dynamic key) async {
    try {
      await box.delete(key);
      await box.flush();
    } catch (e) {
      throw Exception('Failed to delete value for key $key: $e');
    }
  }

  /// Deletes a value at a specific index in a box
  static Future<void> deleteValueAt<T>(Box<T> box, int index) async {
    try {
      await box.deleteAt(index);
      await box.flush();
    } catch (e) {
      throw Exception('Failed to delete value at index $index: $e');
    }
  }

  /// Clears all values from a box
  static Future<void> clearBox<T>(Box<T> box) async {
    try {
      await box.clear();
      await box.flush();
    } catch (e) {
      throw Exception('Failed to clear box: $e');
    }
  }

  /// Gets the number of values in a box
  static int getBoxLength<T>(Box<T> box) {
    try {
      return box.length;
    } catch (e) {
      throw Exception('Failed to get box length: $e');
    }
  }

  /// Checks if a box is empty
  static bool isBoxEmpty<T>(Box<T> box) {
    try {
      return box.isEmpty;
    } catch (e) {
      throw Exception('Failed to check if box is empty: $e');
    }
  }

  /// Checks if a box contains a specific key
  static bool containsKey<T>(Box<T> box, dynamic key) {
    try {
      return box.containsKey(key);
    } catch (e) {
      throw Exception('Failed to check if box contains key $key: $e');
    }
  }

  /// Gets all keys from a box
  static Iterable<dynamic> getAllKeys<T>(Box<T> box) {
    try {
      return box.keys;
    } catch (e) {
      throw Exception('Failed to get all keys: $e');
    }
  }

  /// Flushes a box to ensure data is written to disk
  static Future<void> flushBox<T>(Box<T> box) async {
    try {
      await box.flush();
    } catch (e) {
      throw Exception('Failed to flush box: $e');
    }
  }

  /// Checks if a box is open
  static bool isBoxOpen<T>(Box<T> box) {
    try {
      return box.isOpen;
    } catch (e) {
      throw Exception('Failed to check if box is open: $e');
    }
  }

  /// Gets the name of a box
  static String getBoxName<T>(Box<T> box) {
    try {
      return box.name;
    } catch (e) {
      throw Exception('Failed to get box name: $e');
    }
  }
}

/// A mixin that provides generic Hive repository functionality.
/// Use this mixin in your repositories to get common Hive operations.
mixin HiveRepositoryMixin<T> {
  late Box<T> _box;

  /// The name of the Hive box. Must be overridden by the implementing class.
  String get boxName;

  /// Returns the opened Hive box.
  Box<T> get box => _box;

  /// Initializes and opens the Hive box.
  Future<void> initBox() async {
    try {
      _box = await HiveUtils.openBox<T>(boxName);
    } catch (e) {
      throw Exception('Failed to open box $boxName: $e');
    }
  }

  /// Gets all items from the box.
  List<T> getAllItems() => HiveUtils.getAllValues(_box);

  /// Gets an item by key.
  T? getItem(dynamic key) => HiveUtils.getValue(_box, key);

  /// Adds an item to the box.
  Future<dynamic> addItem(T item) async {
    return await HiveUtils.addValue(_box, item);
  }

  /// Puts an item with a specific key.
  Future<void> putItem(dynamic key, T item) async {
    await HiveUtils.putValue(_box, key, item);
  }

  /// Updates an item at a specific index.
  Future<void> updateItemAt(int index, T item) async {
    await HiveUtils.updateValueAt(_box, index, item);
  }

  /// Deletes an item by key.
  Future<void> deleteItem(dynamic key) async {
    await HiveUtils.deleteValue(_box, key);
  }

  /// Deletes an item at a specific index.
  Future<void> deleteItemAt(int index) async {
    await HiveUtils.deleteValueAt(_box, index);
  }

  /// Clears all items from the box.
  Future<void> clearAllItems() async {
    await HiveUtils.clearBox(_box);
  }

  /// Gets the number of items in the box.
  int get itemCount => HiveUtils.getBoxLength(_box);

  /// Checks if the box is empty.
  bool get isEmpty => HiveUtils.isBoxEmpty(_box);

  /// Checks if the box contains a specific key.
  bool containsItem(dynamic key) => HiveUtils.containsKey(_box, key);

  /// Gets all keys from the box.
  Iterable<dynamic> getAllKeys() => HiveUtils.getAllKeys(_box);

  /// Flushes the box to ensure data is written to disk.
  Future<void> flushItems() async {
    await HiveUtils.flushBox(_box);
  }

  /// Checks if the box is open.
  bool get isBoxOpen => HiveUtils.isBoxOpen(_box);

  /// Closes the Hive box.
  void closeBox() {
    HiveUtils.closeBox(_box);
  }
}
