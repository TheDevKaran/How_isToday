import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:how_is_today/consts/images.dart';
import 'package:how_is_today/controllers/main_controller.dart';
import 'package:how_is_today/models/hourly_weather_model.dart';
import '../consts/strings.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Get.find<MainController>();

    return FutureBuilder(
      future: controller.hourlyWeatherData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          HourlyWeatherData hourlyData = snapshot.data;

          return SizedBox(
            height: 160,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: hourlyData.list!.length > 12 ? 12 : hourlyData.list!.length,
              itemBuilder: (BuildContext context, int index) {
                var time = DateFormat.jm().format(
                  DateTime.fromMillisecondsSinceEpoch(hourlyData.list![index].dt!.toInt() * 1000),
                );

                return Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: Vx.gray200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      time.text.make(),
                      Image.asset(
                        "assets/weather/${hourlyData.list![index].weather![0].icon}.png",
                        width: 80,
                      ),
                      10.heightBox,
                      "${hourlyData.list![index].main!.temp}$degree".text.make(),
                    ],
                  ),
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
