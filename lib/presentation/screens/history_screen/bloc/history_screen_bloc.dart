import 'package:bloc/bloc.dart';
import 'package:cats_task/di/app_di.dart';
import 'package:cats_task/domain/AppRepository.dart';
import 'package:meta/meta.dart';

import '../../../../data/source/local/cats_model_hive.dart';

part 'history_screen_event.dart';

part 'history_screen_state.dart';

class HistoryScreenBloc extends Bloc<HistoryScreenEvent, HistoryScreenState> {
  HistoryScreenBloc() : super(HistoryScreenState()) {
    final repository = getIt<AppRepository>();
    on<LoadHistoryData>((event, emit) async {
      var list = await repository.getAllHistoryData();
      print("list repository: ${list.length}");
      emit(state.copy(list: list));
    });
  }
}
