import 'package:sqflite/sqflite.dart' as sql;

class SQLhandler {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        prenom TEXT,
        nom TEXT,
        address TEXT,
        phone TEXT,
        email TEXT,
        passwords TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'ogii.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

// Create new user
  static Future<int> createItem(String prenom, String nom, String address,
      String phone, String email, String passwords) async {
    final db = await SQLhandler.db();

    final data = {
      'prenom': prenom,
      'nom': nom,
      'address': address,
      'phone': phone,
      'email': email,
      'passwords': passwords
    };
    final id = await db.insert('users', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLhandler.db();
    return db.query('users', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLhandler.db();
    return db.query('users', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(int id, String prenom, String nom,
      String address, String phone, String email, String passwords) async {
    final db = await SQLhandler.db();

    final data = {
      'prenom': prenom,
      'nom': nom,
      'address': address,
      'phone': phone,
      'email': email,
      'passwords': passwords,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('users', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLhandler.db();
    try {
      await db.delete("users", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }
}
