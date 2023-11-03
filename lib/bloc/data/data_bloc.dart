import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:iml_task/helpers/local_storage_helper.dart';
import 'package:iml_task/helpers/network_helper.dart';
import 'package:iml_task/models/place_model.dart';
import 'package:iml_task/utils/common_codes.dart';
import 'package:iml_task/utils/strings.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<FetchDataEvent>(fetchDataEvent);
  }

  fetchDataEvent(event, emit) async {
    try {
      emit(LoadingState(true));

      if (LocalStorage.read(key: LocalStorageKeys.placeList) == null) {
        if (await NetworkHelper().isConnected()) {
          http.Response response = await http.get(Uri.parse(
              "https://raw.githubusercontent.com/mwgg/Airports/master/airports.json"));
          if (response.statusCode == 200) {
            LocalStorage.write(
                key: LocalStorageKeys.placeList, data: response.body);
          } else {
            snackBar(event.context, title: AppString.somethingWentWrong);
          }
        } else {
          snackBar(event.context, title: AppString.noInternet);
          emit(LoadingState(false));
        }
      }

      List<PlaceModel> tempPlaceList = [];

      for (var ele
          in (json.decode(LocalStorage.read(key: LocalStorageKeys.placeList))
                  as Map<String, dynamic>)
              .values) {
        tempPlaceList.add(PlaceModel.fromJson(ele));
      }
      emit(FetchDataState(tempPlaceList));
    } catch (e) {
      log(e.toString());
      snackBar(event.context, title: AppString.somethingWentWrong);
      emit(LoadingState(false));
    }
  }
}
