import 'package:borrowed_things/modules/home/domain/entities/things.dart';
import 'package:borrowed_things/modules/home/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class ListThingsRepository {
  Future<Either<FailureList, List<Things>>> getAll();
}
