part of 'fact_screen_bloc.dart';

@immutable
abstract class FactScreenEvent {}

class LoadCatsData extends FactScreenEvent {}

class LoadImage extends FactScreenEvent{
  String imageUri;

  LoadImage(this.imageUri);
}
