import 'package:flutter/material.dart';
import 'package:my_flutter_project/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_project/main.dart';
import 'package:my_flutter_project/setting.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            icon: FontAwesomeIcons.calendarDays,
            title: "Today",
            press: (){},
          ),
          BottomNavItem(
            icon: FontAwesomeIcons.dumbbell,
            title: "All Exercises",
            press: (){
              Navigator.push(context,
               MaterialPageRoute(
                builder: (context) => HomeScreen()));
            },
            isActive: true,
          ),BottomNavItem(
            icon: FontAwesomeIcons.gear,
            title: "Setting",
            press: (){
              Navigator.push(context,
               MaterialPageRoute(
                builder: (context) => SettingsScreen()));
            },
          ),
      ]),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function press;
  final bool isActive;
  

  const BottomNavItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(), // Remove the parentheses ()
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            icon,
            size: 30, // Adjust the size of the icon as needed
            color: isActive ? kActiveIconColor : kTextColor, // Adjust the color of the icon as needed
          ),
          Text(
            title,
            style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
          ),
        ],
      ),
    );
  }
}