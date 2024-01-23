import 'package:bloc/bloc.dart';
import 'package:cats_task/data/model/enum/Status.dart';
import 'package:cats_task/data/source/local/cats_model_hive.dart';
import 'package:cats_task/di/app_di.dart';
import 'package:cats_task/domain/AppRepository.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../data/model/cats_model.dart';

part 'fact_screen_event.dart';

part 'fact_screen_state.dart';

class FactScreenBloc extends Bloc<FactScreenEvent, FactScreenState> {
  FactScreenBloc() : super(FactScreenState()) {
    final repository = getIt<AppRepository>();
    on<LoadCatsData>((event, emit) async {
      emit(FactScreenState(status: TaskStatus.LOADING));
      final response = await repository.loadCatsData();

      emit(FactScreenState(status: TaskStatus.SUCCESS, catsModel: response));
      DateTime dateTime = state.catsModel?.firstOrNull?.createdAt ?? DateTime.now();
      String formattedDate = DateFormat.yMd().add_Hm().format(dateTime);
      String formattedDateNow = DateFormat.yMd().add_Hm().format(DateTime.now());
      repository.addUpdates(CatsModelHive(response.firstOrNull?.text ?? "", formattedDate, formattedDateNow));
    });
    on<LoadImage>((event, emit) async {
      emit(FactScreenState(imageUrl: event.imageUri));
    });
  }
}
