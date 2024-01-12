import 'package:how_is_today/consts/images.dart';
import 'package:how_is_today/consts/strings.dart';
import 'package:how_is_today/controllers/main_controller.dart';
import 'package:how_is_today/models/current_weather_model.dart';
import 'package:how_is_today/models/hourly_weather_model.dart';
// import 'package:how_is_today/utils/our_themes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import 'widgets/daily_weather_widget.dart';
import 'widgets/hourly_weather_widget.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat("yMMMMd");
    var timeFormat = DateFormat("h:mm a");

    var date = dateFormat.format(DateTime.now());
    var time = timeFormat.format(DateTime.now());
    var theme = Theme.of(context);
    var controller = Get.put(MainController());

    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: "$date".text.color(theme.primaryColor).fontFamily("poppins").size(20).make(),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            Obx(
                  () => IconButton(
                  onPressed: () {
                    controller.changeTheme();
                  },
                  icon:
                  Icon(controller.isDark.value ? Icons.light_mode : Icons.dark_mode, color: theme.iconTheme.color)),
            ),
            // IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: theme.iconTheme.color))
          ],
        ),
        body: Obx(
              () => controller.isloaded.value == true
              ? Container(
            padding: const EdgeInsets.all(12),
            child: FutureBuilder(
              future: controller.currentWeatherData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  CurrentWeatherData data = snapshot.data;

                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "${data.name}"
                            .text
                            .uppercase
                            .fontFamily("poppins_bold")
                            .size(32)
                            .letterSpacing(3)
                            .color(theme.primaryColor)
                            .make(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/weather/${data.weather![0].icon}.png",
                              width: 80,
                              height: 80,
                            ),
                            RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "${data.main!.temp}$degree",
                                        style: TextStyle(
                                          color: theme.primaryColor,
                                          fontSize: 64,
                                          fontFamily: "poppins",
                                        )),
                                    TextSpan(
                                        text: " ${data.weather![0].main}",
                                        style: TextStyle(
                                          color: theme.primaryColor,
                                          letterSpacing: 3,
                                          fontSize: 14,
                                          fontFamily: "poppins",
                                        )),
                                  ],
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton.icon(
                                onPressed: null,
                                icon: Icon(Icons.expand_less_rounded, color: theme.iconTheme.color),
                                label: "${data.main!.tempMax}$degree".text.color(theme.iconTheme.color).make()),
                            TextButton.icon(
                                onPressed: null,
                                icon: Icon(Icons.expand_more_rounded, color: theme.iconTheme.color),
                                label: "${data.main!.tempMin}$degree".text.color(theme.iconTheme.color).make())
                          ],
                        ),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(3, (index) {
                            var iconsList = [clouds, humidity, windspeed];
                            var values = [
                              "${data.clouds!.all}",
                              "${data.main!.humidity}",
                              "${data.wind!.speed} km/h"
                            ];
                            return Column(
                              children: [
                                Image.asset(
                                  iconsList[index],
                                  width: 60,
                                  height: 60,
                                ).box.gray200.padding(const EdgeInsets.all(8)).roundedSM.make(),
                                10.heightBox,
                                values[index].text.gray400.make(),
                              ],
                            );
                          }),
                        ),
                        10.heightBox,
                        const Divider(),
                        10.heightBox,
                        HourlyWeatherWidget(),
                        10.heightBox,
                        const Divider(),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Next 7 Days".text.semiBold.size(16).color(theme.primaryColor).make(),
                          ],
                        ),
                        DailyWeatherWidget()

                        ,
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
              : const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
