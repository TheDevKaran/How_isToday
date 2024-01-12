// To parse this JSON data, do
//
//     final cityCurrentWeatherData = cityCurrentWeatherDataFromJson(jsonString);

import 'dart:convert';

CityCurrentWeatherData cityCurrentWeatherDataFromJson(String str) => CityCurrentWeatherData.fromJson(json.decode(str));

String cityCurrentWeatherDataToJson(CityCurrentWeatherData data) => json.encode(data.toJson());

class CityCurrentWeatherData {
  Coord coord;

  CityCurrentWeatherData({
    required this.coord,
  });

  factory CityCurrentWeatherData.fromJson(Map<String, dynamic> json) => CityCurrentWeatherData(
    coord: Coord.fromJson(json["coord"]),
  );

  Map<String, dynamic> toJson() => {
    "coord": coord.toJson(),
  };
}

class Coord {
  double lon;
  double lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lon: json["lon"].toDouble(),
    lat: json["lat"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lon": lon,
    "lat": lat,
  };
}


// To parse this JSON data, do
//
//     final currentWeatherData = currentWeatherDataFromJson(jsonString);
//
// import 'dart:convert';
//
// // CurrentWeatherData currentWeatherDataFromJson(String str) => CurrentWeatherData.fromJson(json.decode(str));
//
//  CityCurrentWeatherData cityCurrentWeatherDataFromJson(String str) =>
//     CityCurrentWeatherData.fromJson(json.decode(str));
//
//
// class CityCurrentWeatherData {
//   CityCurrentWeatherData({
//     this.weather,
//     this.main,
//     this.wind,
//     this.clouds,
//     this.dt,
//     this.name,
//     this.coord,
//   });
//   Coord? coord;
//   List<Weather>? weather;
//
//   Main? main;
//
//   Wind? wind;
//   Clouds? clouds;
//   int? dt;
//
//   String? name;
//
//   factory CityCurrentWeatherData.fromJson(Map<String, dynamic> json) => CityCurrentWeatherData(
//     main: Main.fromJson(json["main"]),
//     wind: Wind.fromJson(json["wind"]),
//     clouds: Clouds.fromJson(json["clouds"]),
//     dt: json["dt"],
//     name: json["name"],
//     coord: Coord.fromJson(json["coord"]),
//   );
// }
//
// class Coord {
//   double? lon;
//   double? lat;
//
//   Coord({
//      this.lon,
//      this.lat,
//   });
//
//   factory Coord.fromJson(Map<String, dynamic> json) => Coord(
//     lon: json["lon"]?.toDouble(),
//     lat: json["lat"]?.toDouble(),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "lon": lon,
//     "lat": lat,
//   };
// }
//
// class Clouds {
//   Clouds({
//     this.all,
//   });
//
//   int? all;
//
//   factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
//     all: json["all"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "all": all,
//   };
// }
//
// class Main {
//   Main({
//     this.temp,
//     this.tempMin,
//     this.tempMax,
//     this.humidity,
//   });
//
//   int? temp;
//
//   int? tempMin;
//   int? tempMax;
//
//   int? humidity;
//
//   factory Main.fromJson(Map<String, dynamic> json) => Main(
//     temp: json["temp"].toInt(),
//     tempMin: json["temp_min"].toInt(),
//     tempMax: json["temp_max"].toInt(),
//     humidity: json["humidity"],
//   );
// }
//
// class Weather {
//   Weather({
//     this.main,
//     this.icon,
//   });
//
//   String? main;
//
//   String? icon;
//
//   factory Weather.fromJson(Map<String, dynamic> json) => Weather(
//     main: json["main"],
//     icon: json["icon"],
//   );
// }
//
// class Wind {
//   Wind({
//     this.speed,
//     this.deg,
//   });
//
//   double? speed;
//   int? deg;
//
//   factory Wind.fromJson(Map<String, dynamic> json) => Wind(
//     speed: json["speed"].toDouble(),
//     deg: json["deg"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "speed": speed,
//     "deg": deg,
//   };
// }
