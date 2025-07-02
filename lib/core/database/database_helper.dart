import 'package:meal_app_2/core/model/data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper databaseHelper = DatabaseHelper();

  static Database? _database;

  static Future<Database> getInstance() async {
    _database ??= await initDataBase();
    return _database!;
  }

  static Future<Database> initDataBase() async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, "meals.db"); // أضف الامتداد .db لسلامة الملفات
    return openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );
  }

  static Future<void> onCreate(Database db, int version) async {
    String MealTable = '''
     CREATE TABLE meals (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       title TEXT NOT NULL,
       description TEXT NOT NULL,
       imageUrl TEXT NOT NULL,
       rate INTEGER NOT NULL,
       time INTEGER NOT NULL
     )
    ''';
    await db.execute(MealTable);
  }

  static Future<int> InsertData(ModelFood meal) async {
    final db = await getInstance();
    Map<String, dynamic> meals = meal.tomap();
    return await db.insert("meals", meals);
  }

  static Future<List<ModelFood>> GetData() async {
    final db = await getInstance();
    List<Map<String, dynamic>> mapsjson = await db.query("meals");
    List<ModelFood> meals = mapsjson.map((e) => ModelFood.fromMap(e)).toList();
    return meals;
  }

  // Future<int> updateTask(ModelFood task) async {
  //   final db = await getInstance();
  //   return await db.update(
  //     "task",
  //     task.tomap(),
  //     where: "id = ?",
  //     whereArgs: [task.id],
  //   );
  // }

  Future<int> deleteTask(int id) async {
    final db = await getInstance();
    return await db.delete("task", where: "id = ?", whereArgs: [id]);
  }


  Future<void> closeDatabase() async {
    final db = await getInstance();
    await db.close();
  }
}
