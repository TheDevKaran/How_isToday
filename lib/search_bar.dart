import 'package:flutter/material.dart';

class SearchingBar extends StatelessWidget {
  SearchingBar({Key? key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      body: SafeArea(
        child: SizedBox(
          height: 25, // Set your desired height
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                     // Print the text value
                  },
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
      ),
    );
  }
}
