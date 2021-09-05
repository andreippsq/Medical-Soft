import 'package:final_db_test/model/doctor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DoctorsDatabase{
  static final DoctorsDatabase instance = DoctorsDatabase._init();

  static Database? _database;

  DoctorsDatabase._init();

  Future<Database> get database async{
    if(_database != null)
      return _database!;

    _database = await _initDB ('doctors.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async{
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $tableDoctors (
        ${DoctorFields.id} $idType,
        ${DoctorFields.firstName} $textType,
        ${DoctorFields.lastName} $textType,
        ${DoctorFields.specialty} $textType,
        ${DoctorFields.sealCode} $textType,
        ${DoctorFields.institution} $textType,
        ${DoctorFields.email} $textType,
        ${DoctorFields.password} $textType,
        ${DoctorFields.phoneNumber} $textType
      )
    ''');
  }

  Future<Doctor> createDoctor(Doctor doctor) async{
    final db = await instance.database;
    final id = await db.insert(tableDoctors, doctor.toJson());
    return doctor.copy(id: id);
  }

  Future<Doctor> readDoctor(int id) async{
    final db = await instance.database;
    final maps = await db.query(
      tableDoctors,
      columns: DoctorFields.values,
      where: '${DoctorFields.id} = ?',
      whereArgs: [id],
    );

    if(maps.isNotEmpty){
      return Doctor.fromJson(maps.first);
    } else {
      throw Exception('Id $id was not found');
    }
  }

  Future<List<Doctor>> readAllDoctors() async{
    final db = await instance.database;
    final orderBy = '${DoctorFields.lastName} ASC';
    final result = await db.query(tableDoctors, orderBy: orderBy);
    return result.map((json) => Doctor.fromJson(json)).toList();
  }

  Future<int> updateDoctor(Doctor doctor) async{
    final db = await instance.database;

    return db.update(
        tableDoctors,
        doctor.toJson(),
        where: '${DoctorFields.id} = ?',
        whereArgs: [doctor.id]
    );
  }

  Future<int> deleteDoctor(int id) async{
    final db = await instance.database;

    return await db.delete(
        tableDoctors,
        where: '${DoctorFields.id} = ?',
        whereArgs: [id]
    );
  }

  Future close() async{
    final db = await instance.database;
    db.close();
  }
}