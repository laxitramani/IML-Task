import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iml_task/models/place_model.dart';
import 'package:iml_task/utils/colors.dart';
import 'package:iml_task/utils/common_codes.dart';
import 'package:iml_task/utils/size_config.dart';
import 'package:iml_task/utils/strings.dart';
import 'package:iml_task/utils/text_style.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    PlaceModel data = ModalRoute.of(context)!.settings.arguments as PlaceModel;
    return Scaffold(
      appBar: AppBar(
        title: textWidget(
          AppString.placeDetail,
          style: AppTextStyle.normalText(
            color: AppColors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(data.lat!, data.lon!),
              ),
              markers: {
                Marker(
                  markerId: MarkerId(data.icao!),
                  position: LatLng(data.lat!, data.lon!),
                )
              },
              myLocationButtonEnabled: false,
              myLocationEnabled: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(getProportionateScreenHeight(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textWidget(
                      data.name!,
                      style: AppTextStyle.normalText(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textWidget(data.icao!, style: AppTextStyle.normalText()),
                  ],
                ),
                sizeBoxHeight(10),
                textWidget(
                  "${data.city!}, ${data.state!}",
                  style: AppTextStyle.normalText(color: AppColors.purple),
                ),
                textWidget(
                  data.country!,
                  style: AppTextStyle.normalText(color: AppColors.purple),
                ),
                textWidget(
                  data.tz!,
                  style: AppTextStyle.normalText(color: AppColors.purple),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
