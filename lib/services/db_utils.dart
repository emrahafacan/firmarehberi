import 'package:bosna_mahallesi/models/uyeler.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbUtils {
  static final DbUtils _dbUtils = DbUtils._internal();
  DbUtils._internal();

  factory DbUtils() {
    return _dbUtils;
  }

  static Database _db;
  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    String path = join(await getDatabasesPath(), 'bosnamahallesi_database.db');
    var dbUyeler = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbUyeler;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE uyeler(id INTEGER PRIMARY KEY, firmakodu TEXT, eposta TEXT, sifre TEXT)");
  }

  Future<void> deleteTable() async {
    final Database db = await this.db;
    db.delete('uyeler');
  }

  Future<void> insertUyeler(Uyeler uyeler) async {
    final Database db = await this.db;
    await db.insert(
      'uyeler',
      uyeler.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Uyeler>> uyeler() async {
    final Database db = await this.db;
    final List<Map<String, dynamic>> maps = await db.query('uyeler');
    return List.generate(maps.length, (i) {
      return Uyeler(
        id: maps[i]['id'],
        firmakodu: maps[i]['firmakodu'],
        eposta: maps[i]['eposta'],
        sifre: maps[i]['sifre'],
      );
    });
  }

  Future<void> updateUyeler(Uyeler uyeler) async {
    final db = await this.db;
    await db.update(
      'uyeler',
      uyeler.toMap(),
      where: "id = ?",
      whereArgs: [uyeler.id],
    );
  }

  Future<void> deleteUyeler(int id) async {
    final db = await this.db;
    await db.delete(
      'uyeler',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
