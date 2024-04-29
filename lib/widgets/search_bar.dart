import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SearchBar_ extends StatelessWidget {
  const SearchBar_({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child:  TextField(
        decoration: InputDecoration(
          hintText: "Search",
          icon: FaIcon(Icons.search),
          border: InputBorder.none,
        ),
      ),
      );
  }
}