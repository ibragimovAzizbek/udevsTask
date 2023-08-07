import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class SQLHelper {
  static Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE items(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      time TEXT,
      title TEXT,
      description TEXT,
      location TEXT,
      color TEXT,
      reminderTime TEXT
    )
    """);
    // createAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  }

  static Future<Database> db() async {
    return openDatabase(
      'firsttodo.db',
      version: 1,
      onCreate: (Database db, version) async {
        await SQLHelper.createTables(db);
        print("..creating a table...");
      },
    );
  }

  static Future<int> createItem(
    String time,
    String title,
    String? description,
    String location,
    String color,
    String reminderTime,
  ) async {
    final db = await SQLHelper.db();
    final data = {
      'time': time,
      'title': title,
      'description': description,
      'location': location,
      'color': color,
      'reminderTime': reminderTime
    };
    final id = await db.insert('items', data,
        conflictAlgorithm: ConflictAlgorithm.fail);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();

    return db.query('items', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();

    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
    int id,
    String time,
    String title,
    String? description,
    String location,
    String color,
    String reminderTime,
  ) async {
    final db = await SQLHelper.db();

    final data = {
      'time': time,
      'title': title,
      'description': description,
      'location': location,
      'color': color,
      'reminderTime': reminderTime
    };

    final result =
        await db.update('items', data, where: "id = ?", whereArgs: [id]);

    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('items', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint("Something went wrong when deleting an item $e");
    }
  }
}
