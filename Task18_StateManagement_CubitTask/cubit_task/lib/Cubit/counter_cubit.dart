import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  increnment() {
    emit(state + 1);
  }

  decrement() {
    emit(state - 1);
  }
}
