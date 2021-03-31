import 'package:borrowed_things/app_module.dart';
import 'package:borrowed_things/modules/home/domain/usecases/list_things_order_by_return.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  initModule(AppModule());
  test('should return usecases without error', () async {
    final useCase = Modular.get<ListThingsOrderByReturn>();
    expect(useCase, isA<ListThingsOrderByReturn>());
  });
}
