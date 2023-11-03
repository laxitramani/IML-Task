part of 'data_bloc.dart';

sealed class DataState {}

final class DataInitial extends DataState {}

final class LoadingState extends DataState {
  bool isLoading;
  LoadingState(this.isLoading);
}

final class FetchDataState extends DataState {
  List<PlaceModel> placeData;
  FetchDataState(this.placeData);
}
