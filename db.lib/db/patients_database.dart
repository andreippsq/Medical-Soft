import 'package:final_db_test/model/patient.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PatientsDatabase{
  static final PatientsDatabase instance = PatientsDatabase._init();

  static Database? _database;

  PatientsDatabase._init();

  Future<Database> get database async{
    if(_database != null)
      return _database!;

    _database = await _initDB ('patients.db');
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
      CREATE TABLE $tablePatients (
        ${PatientFields.id} $idType,
        ${PatientFields.firstName} $textType,
        ${PatientFields.lastName} $textType,
        ${PatientFields.address} $textType,
        ${PatientFields.email} $textType,
        ${PatientFields.password} $textType,
        ${PatientFields.phoneNumber} $textType,
        ${PatientFields.age} $textType
      )
    ''');
  }

  Future<Patient> createPatient(Patient patient) async{
    final db = await instance.database;
    final id = await db.insert(tablePatients, patient.toJson());
    return patient.copy(id: id);
  }

  Future<Patient> readPatient(int id) async{
    final db = await instance.database;
    final maps = await db.query(
      tablePatients,
      columns: PatientFields.values,
      where: '${PatientFields.id} = ?',
      whereArgs: [id]
    );

    if(maps.isNotEmpty){
      return Patient.fromJson(maps.first);
    } else {
      throw Exception('Id $id was not found');
    }
  }

  Future<List<Patient>> readAllPatients() async{
    final db = await instance.database;
    final orderBy = '${PatientFields.lastName} ASC';
    final result = await db.query(tablePatients, orderBy: orderBy);
    return result.map((json) => Patient.fromJson(json)).toList();
  }

  Future<int> updatePatient(Patient patient) async{
    final db = await instance.database;

    return db.update(
        tablePatients,
        patient.toJson(),
        where: '${PatientFields.id} = ?',
        whereArgs: [patient.id]
    );
  }

  Future<int> deletePatient(int id) async{
    final db = await instance.database;

    return await db.delete(
        tablePatients,
        where: '${PatientFields.id} = ?',
        whereArgs: [id]
    );
  }

  Future close() async{
    final db = await instance.database;
    db.close();
  }
}