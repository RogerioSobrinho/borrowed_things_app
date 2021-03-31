import 'package:borrowed_things/modules/home/domain/errors/errors.dart';
import 'package:borrowed_things/modules/home/infra/models/things_model.dart';
import 'package:dartz/dartz.dart';

abstract class ListThingsDataSource {
  Future<Either<DataBaseError, List<ThingsModel>>> getAll();
}
