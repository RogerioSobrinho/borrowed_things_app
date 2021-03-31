import 'package:borrowed_things/modules/home/domain/errors/errors.dart';
import 'package:borrowed_things/modules/home/external/datasource/list_things_datasource_impl.dart';
import 'package:borrowed_things/modules/home/infra/models/things_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ListThingsDataSourceImplMock extends Mock
    implements ListThingsDataSourceImpl {}

main() {
  // i'm need study about unit testing with SQLITE, because i'm not understand this type mock implementation
  // so ListThingsDataSourceImpl implementation is mocked
  // is it correct? i don't know
  final datasource = ListThingsDataSourceImplMock();
  test('should return all things', () async {
    when(datasource.getAll()).thenAnswer((_) async => Right(<ThingsModel>[]));
    final result = await datasource.getAll();
    expect(result | null, isA<List<ThingsModel>>());
  });

  test('should return exception if DbProvider fail', () async {
    when(datasource.getAll()).thenThrow(DataBaseError());
    // Exception: is it a good implementation? I don't think so
    try {
      await datasource.getAll();
    } catch (error) {
      expect(error, isA<DataBaseError>());
    }
  });
}
