import 'dart:io';

import 'package:flutter_gsg_01/local_storage/model/category.dart';
import 'package:flutter_gsg_01/local_storage/model/product.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database database;

  static final String databaseName = 'e_commerce.db';

  // Product Table
  static final String tableProductName = 'product';
  static final String columnProductId = 'id';
  static final String columnProductName = 'productName';
  static final String columnProductDescription = 'productDescription';
  static final String columnProductPrice = 'productPrice';
  static final String columnCatId = 'categoryId';

  // Category Table
  static final String tableCategoryName = 'category';
  static final String columnCategoryId = 'id';
  static final String columnCategoryName = 'categoryName';

  Future<Database> initDatabase() async {
    if (database == null) {
      return await getDatabaseConnection();
    } else {
      return database;
    }
  }

  /* 
  1. Product Entity
  productId --> primaryKey
  productName 
  productDescription
  productPrice
  categoryId ---> foreignKey
  brandId ---> foreignKey

  2. Category Entity
  categoryId  --> primaryKey
  categoryName
  categoryCreateDate
  categoryExpiredDate
  categoryWeight

  3. Brand Entity
  brandId --> primaryKey
  brandName
  brandCountry
 */

  Future<Database> getDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = p.join(directory.path, databaseName);

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE $tableProductName (
          $columnProductId INTEGER PRIMARY KEY AUTOINCREMENT,
          $columnProductName TEXT NOT NULL,
          $columnProductDescription TEXT NOT NULL,
          $columnProductPrice REAL,
          $columnCatId INTEGER NOT NULL,
          FOREIGN KEY($columnCatId) REFERENCES $tableCategoryName($columnCategoryId) ON DELETE CASCADE
        );
        ''');
        db.execute('''CREATE TABLE $tableCategoryName (
          $columnCategoryId INTEGER PRIMARY KEY AUTOINCREMENT,
          $columnCategoryName TEXT NOT NULL
        );''');
        print('the database that has the version $version has been created');
      },
      onConfigure: (db) {
        db.execute('PRAGMA foreign_key = ON');
      },
      onOpen: (db) {
        print('the database has been opened');
      },
    );
    return database;
  }

  insertProduct(Product product) async {
    int rowColumn = await database.insert(
      tableProductName,
      product.toMap(),
    );
    print(rowColumn);
  }

  insertCategory(Category category) async {
    int rowColumn = await database.insert(
      tableCategoryName,
      category.toMap(),
    );
    print(rowColumn);
  }

  /*
  // CRUD Operation => Create, Read, Update, and Delete
  insertTask(Task task) async {
    int rowColumn = await database.insert(
      tableName,
      task.toMap(),
    );
    print(rowColumn);
  }

  Future<List<Task>> selectAllTasks() async {
    List<Map<String, Object>> result = await database.query(tableName);
    List<Task> tasks = result.map((e) => Task.fromMap(e)).toList();
    return tasks;
  }

  Future<Task> selectSpecificTask(int id) async {
    List<Map<String, Object>> result = await database
        .query(tableName, where: '$columnTaskId = ?', whereArgs: [id]);
    Task task = Task.fromMap(result.first);
    return task;
  }

  deleteTask(int id) async {
    await database
        .delete(tableName, where: '$columnTaskId = ?', whereArgs: [id]);
  }

  updateTask(Task task) async {
    await database.update(tableName, task.toMap(),
        where: '$columnTaskId = ?', whereArgs: [task.id]);
  }
  */
}
