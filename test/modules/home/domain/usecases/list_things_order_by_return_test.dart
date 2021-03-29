import 'package:borrowed_things/modules/home/domain/entities/things.dart';
import 'package:borrowed_things/modules/home/domain/repositories/list_things_repository.dart';
import 'package:borrowed_things/modules/home/domain/usecases/list_things_order_by_return.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ListThingsRepositoryMock extends Mock implements ListThingsRepository {}

main() {
  final repository = ListThingsRepositoryMock();
  final useCase = ListThingsOrderByReturnImpl(repository);
  test('should return a list of things', () async {
    when(repository.getAll()).thenAnswer((_) async => Right(<Things>[]));
    final result = await useCase();
    expect(result | null, isA<List<Things>>());
  });
}
