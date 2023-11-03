import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iml_task/bloc/data/data_bloc.dart';
import 'package:iml_task/models/place_model.dart';
import 'package:iml_task/utils/colors.dart';
import 'package:iml_task/utils/common_codes.dart';
import 'package:iml_task/utils/routes.dart';
import 'package:iml_task/utils/size_config.dart';
import 'package:iml_task/utils/strings.dart';
import 'package:iml_task/utils/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  List<PlaceModel> placeList = [];

  @override
  void initState() {
    context.read<DataBloc>().add(FetchDataEvent(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        if (state is LoadingState) {
          isLoading = state.isLoading;
        } else if (state is FetchDataState) {
          isLoading = false;
          placeList = state.placeData;
        }
        return Scaffold(
          appBar: AppBar(
            title: textWidget(
              AppString.places,
              style: AppTextStyle.normalText(
                color: AppColors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: AppColors.orange,
          ),
          body: isLoading
              ? const Center(child: CircularProgressIndicator())
              : placeList.isEmpty
                  ? Center(
                      child: textWidget(
                        AppString.noPlacesFound,
                        style: AppTextStyle.normalText(
                          fontSize: 20,
                          color: AppColors.black50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: placeList.length,
                      // padding: EdgeInsets.all(getProportionateScreenHeight(15)),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => RoutePage.navigator(
                          context,
                          mode: Mode.push,
                          moveTo: RouteName.detailScreen,
                          bundle: placeList[index],
                        ),
                        child: Card(
                          color: AppColors.purple10,
                          surfaceTintColor: AppColors.purple10,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(
                                getProportionateScreenHeight(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textWidget(
                                        placeList[index].name!,
                                        style: AppTextStyle.normalText(),
                                      ),
                                      textWidget(
                                          "${placeList[index].city!}, ${placeList[index].state!}"),
                                    ],
                                  ),
                                ),
                                sizeBoxWidth(5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWidget(placeList[index].icao!),
                                    textWidget(placeList[index].country!),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
        );
      },
    );
  }
}
