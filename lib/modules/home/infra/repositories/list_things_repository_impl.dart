import 'package:borrowed_things/modules/home/domain/entities/things.dart';
import 'package:borrowed_things/modules/home/domain/errors/errors.dart';
import 'package:borrowed_things/modules/home/domain/repositories/list_things_repository.dart';
import 'package:borrowed_things/modules/home/infra/datasource/list_things_datasource.dart';
import 'package:dartz/dartz.dart';

class ListThingsRepositoryImpl implements ListThingsRepository {
  final ListThingsDataSource dataSource;

  ListThingsRepositoryImpl(this.dataSource);

  @override
  Future<Either<FailureList, List<Things>>> getAll() async {
    try {
      return await this.dataSource.getAll();
    } catch (error) {
      return Left(DataSourceError());
    }
  }
}
