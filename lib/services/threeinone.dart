// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import '../controllers/main_controller.dart';
// import '../consts/strings.dart';
// import '../models/current_weather_model.dart';
// import '../models/daily_weather_model.dart';
// import '../models/hourly_weather_model.dart';
//
// // var latitude = 0.0.obs;
// // var longitude = 0.0.obs;
//
// class WeatherData {
//   final CurrentWeatherData currentWeatherData;
//   final DailyWeatherData dailyWeatherData;
//   final HourlyWeatherData hourlyWeatherData;
//
//   WeatherData({
//     required this.currentWeatherData,
//     required this.dailyWeatherData,
//     required this.hourlyWeatherData,
//   });
// }
//
// // Future<WeatherData> getWeatherData(double lat, double long) async {
// //   var link =
// //       "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&appid=$apiKey&units=metric";
// //   var res = await http.get(Uri.parse(link));
// //
// //   if (res.statusCode == 200) {
// //     var jsonData = res.body.toString();
// //     var currentWeatherData = currentWeatherDataFromJson(jsonData);
// //     var dailyWeatherData = dailyWeatherDataFromJson(jsonData);
// //     var hourlyWeatherData = hourlyWeatherDataFromJson(jsonData);
// //
// //     return WeatherData(
// //       currentWeatherData: currentWeatherData,
// //       dailyWeatherData: dailyWeatherData,
// //       hourlyWeatherData: hourlyWeatherData,
// //     );
// //   } else {
// //     throw Exception('Failed to load weather data');
// //   }
// // }
// //
// // // Example usage:
// // void fetchWeatherData() async {
// //   try {
// //     var weatherData = await getWeatherData(latitude.value, longitude.value);
// //
// //     // Access individual data using weatherData.currentWeatherData, weatherData.dailyWeatherData, etc.
// //     // Do something with the data...
// //   } catch (e) {
// //     print('Error fetching weather data: $e');
// //   }
// // }
