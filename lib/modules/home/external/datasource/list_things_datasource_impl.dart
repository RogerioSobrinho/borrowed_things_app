import 'dart:io';

import 'package:borrowed_things/modules/home/domain/errors/errors.dart';
import 'package:borrowed_things/modules/home/infra/datasource/list_things_datasource.dart';
import 'package:borrowed_things/modules/home/infra/models/things_model.dart';
import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ListThingsDataSourceImpl implements ListThingsDataSource {
  @override
  Future<Either<DataBaseError, List<ThingsModel>>> getAll() async {
    try {
      final db = await _getInstance();
      final List<Map<String, dynamic>> maps =
          await db.query('things', orderBy: 'returnDate DESC');
      final list = List.generate(maps.length, (i) {
        return ThingsModel.fromMap(maps[i]);
      });
      return Right(list);
    } catch (error) {
      return Left(DataBaseError());
    }
  }

  Future<Database> _getInstance() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "borrowed_things_db.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE things ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "description TEXT"
          ")");
    });
  }
}
