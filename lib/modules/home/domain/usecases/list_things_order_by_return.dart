import 'package:borrowed_things/modules/home/domain/entities/things.dart';
import 'package:borrowed_things/modules/home/domain/errors/errors.dart';
import 'package:borrowed_things/modules/home/domain/repositories/list_things_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ListThingsOrderByReturn {
  Future<Either<FailureList, List<Things>>> call();
}

class ListThingsOrderByReturnImpl implements ListThingsOrderByReturn {
  final ListThingsRepository repository;

  ListThingsOrderByReturnImpl(this.repository);

  @override
  Future<Either<FailureList, List<Things>>> call() async {
    return this.repository.getAll();
  }
}
