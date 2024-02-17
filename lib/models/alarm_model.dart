// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class AlarmModel {
//   String? alarmTitle;
//   String? alarmTime;
//   List<String> alarmDays = [];
//   bool? deleteAfterRinging;
//   bool? vibrateWhenRinging;
//   LatLng? alarmLocation;
// }

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path/path.dart';
//gpt's
import 'package:sqflite/sqflite.dart';

class AlarmModel {
  int? id;
  String? alarmTitle;
  String? alarmTime;
  List<String> alarmDays = [];
  bool? deleteAfterRinging;
  bool? vibrateWhenRinging;
  LatLng? alarmLocation;

  // Constructor
  AlarmModel({
    this.id,
    this.alarmTitle,
    this.alarmTime,
    required this.alarmDays,
    this.deleteAfterRinging,
    this.vibrateWhenRinging,
    this.alarmLocation,
  });

  // Convert AlarmModel object to a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'alarmTitle': alarmTitle,
      'alarmTime': alarmTime,
      'alarmDays':
          alarmDays.join(','), // Convert list to comma-separated string
      'deleteAfterRinging': deleteAfterRinging,
      'vibrateWhenRinging': vibrateWhenRinging,
      // 'deleteAfterRinging': deleteAfterRinging ? 1 : 0,
      // 'vibrateWhenRinging': vibrateWhenRinging ? 1 : 0,
      'alarmLocationLat': alarmLocation?.latitude,
      'alarmLocationLng': alarmLocation?.longitude,
    };
  }

  // Factory method to create an AlarmModel object from a Map object
  factory AlarmModel.fromMap(Map<String, dynamic> map) {
    return AlarmModel(
      id: map['id'],
      alarmTitle: map['alarmTitle'],
      alarmTime: map['alarmTime'],
      alarmDays: (map['alarmDays'] as String)
          .split(','), // Convert comma-separated string to a list
      deleteAfterRinging: map['deleteAfterRinging'] == 1 ? true : false,
      vibrateWhenRinging: map['vibrateWhenRinging'] == 1 ? true : false,
      alarmLocation:
          map['alarmLocationLat'] != null && map['alarmLocationLng'] != null
              ? LatLng(map['alarmLocationLat'], map['alarmLocationLng'])
              : null,
    );
  }
}

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

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
        deleteAfterRinging INTEGER,
        vibrateWhenRinging INTEGER,
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
