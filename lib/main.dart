import 'package:how_is_today/utils/our_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

main() {
  runApp(const App());
}

class App extends StatelessWidget {

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();


    return GetMaterialApp(
      // routes: {"/loading" : (context) => },
      theme: CustomThemes.lightTheme,
      darkTheme: CustomThemes.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {print(searchController.text);},
                  child: Container(
                    child: Icon(Icons.search, color: Colors.blueAccent),
                    margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                  ),
                ),
                Expanded(
                  child: Material(
                    child: TextField(

                      controller: searchController,

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Any City...",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: WeatherApp(),
      ),
    );
  }
}
