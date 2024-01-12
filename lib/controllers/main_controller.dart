
import 'package:how_is_today/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:how_is_today/main.dart';

class MainController extends GetxController {


  @override
  void onInit() async {
    await getUserLocation();
    currentWeatherData = getCurrentWeather(latitude.value, longitude.value);
    hourlyWeatherData = getHourlyWeather(latitude.value, longitude.value);
    dailyWeatherData = getDailyWeather(latitude.value, longitude.value);
    getWeatherData(cityWeatherData.coord.lat, cityWeatherData.coord.lon);
// getSearchResult();
    super.onInit();
  }
  getWeatherData(lat, log)  {
    print(lat);
    print(log);
    currentWeatherData  =  getCurrentWeather(lat, log);
    hourlyWeatherData = getHourlyWeather(lat, log);
    dailyWeatherData = getDailyWeather(lat, log);
  }
  // getSearchResult() async{
  //
  //   cityWeatherData= await getCityCurrentWeather();
  //   // print(cityWeatherData.coord.lat);
  //   getWeatherData(cityWeatherData.coord.lat, cityWeatherData.coord.lon);
  // }
  var isDark = false.obs;
  dynamic currentWeatherData;
  dynamic hourlyWeatherData;
  dynamic dailyWeatherData;
  dynamic cityWeatherData;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  var isloaded = false.obs;

  changeTheme() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }

  getUserLocation() async {
    bool isLocationEnabled;
    LocationPermission userPermission;

    isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      return Future.error("Location is not enabled");
    }

    userPermission = await Geolocator.checkPermission();
    if (userPermission == LocationPermission.deniedForever) {
      return Future.error("Permission is denied forever");
    } else if (userPermission == LocationPermission.denied) {
      userPermission = await Geolocator.requestPermission();
      if (userPermission == LocationPermission.denied) {
        return Future.error("Permission is denied");
      }
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value) async {
      latitude.value = value.latitude;
      longitude.value = value.longitude;
       getWeatherData(value.latitude, value.longitude);
      // await getSearchResult();
      isloaded.value = true;

    });
  }
}
