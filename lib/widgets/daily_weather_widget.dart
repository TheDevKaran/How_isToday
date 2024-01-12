import 'package:flutter/material.dart';
import 'package:how_is_today/models/daily_weather_model.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/main_controller.dart';
import 'package:intl/intl.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Get.find<MainController>();

    return FutureBuilder(
      future: controller.dailyWeatherData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(
            child: Text('No data available'),
          );
        } else {
          DailyWeatherData dailyData = snapshot.data;

          // Move the loop here to create a list of widgets
          List<Widget> dailyWidgets = List.generate(7, (index) {
            var currentDayData = dailyData.list[index];
            return Card(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        DateFormat("EEEE").format(
                          DateTime.now().add(Duration(days: index + 1)),
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                          fontFamily: "poppins",
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/weather/${currentDayData.weather[0].icon}.png",
                            width: 40,
                          ),
                          const SizedBox(width: 60),
                          "${currentDayData.main.tempMax}\u00B0 / ${currentDayData.main.tempMin}\u00B0"
                              .text
                              .size(16)
                              .color(theme.primaryColor)
                              .make(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });

          // Return a Column with the list of widgets
          return Column(
            children: dailyWidgets,
          );
        }
      },
    );
  }
}
