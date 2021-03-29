import 'package:borrowed_things/modules/home/infra/models/list_things_model.dart';

abstract class ListThingsDataSource {
  Future<List<ListThingsModel>> getAll();
}
