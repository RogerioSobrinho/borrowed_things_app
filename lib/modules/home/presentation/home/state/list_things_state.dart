import 'package:borrowed_things/modules/home/domain/entities/things.dart';
import 'package:borrowed_things/modules/home/domain/errors/errors.dart';

abstract class ListThingsState {}

class StartState implements ListThingsState {
  const StartState();
}

class LoadingState implements ListThingsState {
  const LoadingState();
}

class ErrorState implements ListThingsState {
  final FailureList error;
  const ErrorState(this.error);
}

class SuccessState implements ListThingsState {
  final List<Things> list;
  const SuccessState(this.list);
}
