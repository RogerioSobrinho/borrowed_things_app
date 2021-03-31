import 'package:borrowed_things/modules/home/domain/entities/things.dart';
import 'package:borrowed_things/modules/home/domain/errors/errors.dart';
import 'package:borrowed_things/modules/home/infra/datasource/list_things_datasource.dart';
import 'package:borrowed_things/modules/home/infra/models/things_model.dart';
import 'package:borrowed_things/modules/home/infra/repositories/list_things_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ListThingsDataSourceMock extends Mock implements ListThingsDataSource {}

main() {
  final dataSource = ListThingsDataSourceMock();
  final repository = ListThingsRepositoryImpl(dataSource);
  test('should return list of things', () async {
    when(dataSource.getAll()).thenAnswer((_) async => Right(<ThingsModel>[]));
    final result = await repository.getAll();
    expect(result | null, isA<List<Things>>());
  });

  test('should return exception if datasource fail', () async {
    when(dataSource.getAll()).thenThrow(DataSourceError());
    final result = await repository.getAll();
    expect(result.fold(id, id), isA<DataSourceError>());
  });
}
