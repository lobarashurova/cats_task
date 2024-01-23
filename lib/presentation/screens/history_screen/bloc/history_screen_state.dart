part of 'history_screen_bloc.dart';

class HistoryScreenState {
  List<CatsModelHive>? list;

  HistoryScreenState({this.list});

  HistoryScreenState copy({List<CatsModelHive>? list}) {
    return HistoryScreenState(list: list ?? this.list);
  }
}

