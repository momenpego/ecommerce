
import 'package:flutter_bloc/flutter_bloc.dart';

part 'more_event.dart';
part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  MoreBloc() : super(MoreInitial()) {
    on<MoreEvent>((event, emit) {
    });
  }
}
