// To parse this JSON data, do
//
//     final dailyWeatherData = dailyWeatherDataFromJson(jsonString);

import 'dart:convert';

import 'hourly_weather_model.dart';

DailyWeatherData dailyWeatherDataFromJson(String str) => DailyWeatherData.fromJson(json.decode(str));

String dailyWeatherDataToJson(DailyWeatherData data) => json.encode(data.toJson());

// daily_weather_model.dart

class DailyWeatherData {
  String cod;
  int message;
  int cnt;
  List<ListElement> list;
  City city;

  DailyWeatherData({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory DailyWeatherData.fromJson(Map<String, dynamic> json) => DailyWeatherData(
    cod: json["cod"],
    message: json["message"],
    cnt: json["cnt"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    city: City.fromJson(json["city"]),
  );

  Map<String, dynamic> toJson() => {
    "cod": cod,
    "message": message,
    "cnt": cnt,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "city": city.toJson(),
  };
}

class ListElement {
  int dt;
  MainClass main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;
  Sys sys;
  String dtTxt;

  ListElement({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.sys,
    required this.dtTxt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    dt: json["dt"],
    main: MainClass.fromJson(json["main"]),
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    clouds: Clouds.fromJson(json["clouds"]),
    wind: Wind.fromJson(json["wind"]),
    sys: Sys.fromJson(json["sys"]),
    dtTxt: json["dt_txt"],
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "main": main.toJson(),
    "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
    "clouds": clouds.toJson(),
    "wind": wind.toJson(),
    "sys": sys.toJson(),
    "dt_txt": dtTxt,
  };
}

class Clouds {
  int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json["all"],
  );

  Map<String, dynamic> toJson() => {
    "all": all,
  };
}

class MainClass {
  int tempMin;
  int tempMax;
  int humidity;

  MainClass({
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
    tempMin: json["temp_min"].toInt(),
    tempMax: json["temp_max"].toInt(),
    humidity: json["humidity"],
  );

  Map<String, dynamic> toJson() => {
    "temp_min": tempMin,
    "temp_max": tempMax,
    "humidity": humidity,
  };
}

class Weather {
  String icon;

  Weather({
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "icon": icon,
  };
}

class Wind {
  double speed;

  Wind({
    required this.speed,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
  };
}

class Sys {
  String pod;

  Sys({
    required this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    pod: json["pod"],
  );

  Map<String, dynamic> toJson() => {
    "pod": pod,
  };
}
