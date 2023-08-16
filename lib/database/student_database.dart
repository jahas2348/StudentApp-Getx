import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:student_app_1/models/student.dart';

class StudentDatabase {
  late Database _database;

  Future<void> initializeDatabase() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'student.db');

    _database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE students (
            id INTEGER PRIMARY KEY,
            studentName TEXT,
            studentAge TEXT,
            studentregNum TEXT,
            studentBatch TEXT,
            studentProfile TEXT
          )
        ''');
      },
    );
  }

  Future<StudentModel> insertStudent(StudentModel student) async {
    await initializeDatabase();
    int id = await _database.insert('students', student.toMap());
    final insertUser = await _database.query(
      'students',
      where: 'id = ?',
      whereArgs: [id],

    );
    return  StudentModel.fromMap(insertUser.first);
     
  }

  Future<List<StudentModel>> fetchStudents() async {
    await initializeDatabase();
    final List<Map<String, dynamic>> maps = await _database.query('students');
    return List.generate(maps.length, (index) {
      return StudentModel.fromMap(maps[index]);
    });
  }

  Future<int> updateStudent(StudentModel student) async {
    await initializeDatabase();
    return await _database.update(
      'students',
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  Future<int> deleteStudent(int id) async {
    await initializeDatabase();
    return await _database.delete(
      'students',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> closeDatabase() async {
    await _database.close();
  }
}
