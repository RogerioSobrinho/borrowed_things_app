import 'package:bloc/bloc.dart';
import 'package:borrowed_things/modules/home/presentation/home/state/list_things_state.dart';

class HomeBloc extends Bloc<int, ListThingsState> {
  HomeBloc() : super(const StartState());

  @override
  Stream<ListThingsState> mapEventToState(int event) async* {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
