import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/alarm_model.dart';

 class DataBase {
  static final DataBase instance = DataBase._privateConstructor();
  static Database? _database;

  DataBase._privateConstructor();

  Future<Database> get database async { 
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'alarms.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE alarms(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        alarmTitle TEXT,
        alarmTime TEXT,
        alarmDays TEXT,
        deleteAfterRinging BOOL,
        vibrateWhenRinging BOOL,
        alarmLocationLat REAL,
        alarmLocationLng REAL
      )
    ''');
  }

  Future<int> insertAlarm(AlarmModel alarm) async {
    Database db = await instance.database;
    return await db.insert('alarms', alarm.toMap());
  }

  Future<List<AlarmModel>> getAlarms() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query('alarms');
    return List.generate(maps.length, (i) {
      return AlarmModel.fromMap(maps[i]);
    });
  }
}
