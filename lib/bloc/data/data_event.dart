part of 'data_bloc.dart';

sealed class DataEvent {}

class FetchDataEvent extends DataEvent {
  BuildContext context;

  FetchDataEvent(this.context);
}
