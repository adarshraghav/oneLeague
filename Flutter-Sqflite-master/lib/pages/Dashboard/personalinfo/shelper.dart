import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  //name of database:
  static final _dbName = 'lala.db';
  static final _dbVersion = 1;
  static final _tableName = 'mylala';

  static final columnId = '_id';
  static final columnFName = '_firstname';
  static final columnLName = '_lastname';
  static final columnemail = '_email';
  static final columndob = '_dob';

  //here we are making this class a singleton class
  DatabaseHelper._privateConstruction();
  static final DatabaseHelper instance = DatabaseHelper._privateConstruction();

  //creating the database
  static Database _database;
  //this function returns the database we just created in line 13
  Future<Database> get database async {
    //if the database is not null return the database
    if (_database != null) return _database;

    //if the database is null then initiate the database
    //and then return the database
    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    //documents directory is used to store the application data
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    //open the database
    //we use the onCreate para to mention what happens when we open database
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  //create table:
  Future _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $_tableName(
        $columnId INTEGER PRIMARY KEY,
        $columnFName TEXT NOT NULL,
        $columnLName TEXT NOT NULL,
        $columnemail TEXT NOT NULL,
        $columndob TEXT NOT NULL
      )
      ''');
  }

  //here we are using a map because the insert func only takes a map
  Future<int> insert(Map<String, dynamic> row) async {
    //getting the present database instance
    Database db = await instance.database;
    //the primary key will auto generate upon returning
    return await db.insert(_tableName, row);
  }

  //Here we will return all values in the table
  //we return a list which is of a type MAP and the map is of type STRING
  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(_tableName, row,
        where: '$columnId = ? $columnFName = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
