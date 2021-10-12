import 'package:ogiiapp/models/users_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//import './users.dart';

class UsersDatabase {
  static final UsersDatabase instance = UsersDatabase._init();

  static Database? _database;
  UsersDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('ogiidb.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''CREATE TABLE $tableUser (
      ${UsersField.id} $idType,
      ${UsersField.prenom} $textType,
      ${UsersField.nom} $textType,
      ${UsersField.address} $textType,
      ${UsersField.email} $textType,
      ${UsersField.phone} $textType,
      ${UsersField.passwords} $textType
    ) ''');
  }

  Future<UsersModel> create(UsersModel usersModel) async {
    final db = await instance.database;
    final id = await db.insert(tableUser, usersModel.toJson());
    return usersModel.copy(id: id);
  }

  Future<UsersModel> readUser(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUser,
      columns: UsersField.values,
      where: '${UsersField.id}=?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return UsersModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<UsersModel>> readAllUsers() async {
    final db = await instance.database;
    //final orderBy = '${UsersField.createdAt} ASC';
    final result = await db.query(tableUser);
    return result.map((json) => UsersModel.fromJson(json)).toList();
  }

  Future<int> update(UsersModel usersModel) async {
    final db = await instance.database;

    return db.update(
      tableUser,
      usersModel.toJson(),
      where: '${UsersField.id}=?',
      whereArgs: [usersModel.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableUser,
      where: '${UsersField.id}=?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
