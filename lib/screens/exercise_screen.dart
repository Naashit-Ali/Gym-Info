import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_project/constants.dart';
import 'package:my_flutter_project/exercises/abs.dart';
import 'package:my_flutter_project/exercises/arms.dart';
import 'package:my_flutter_project/exercises/back.dart';
import 'package:my_flutter_project/exercises/chest.dart';
import 'package:my_flutter_project/exercises/legs.dart';
import 'package:my_flutter_project/exercises/shoulders.dart';
import 'package:my_flutter_project/widgets/bottom_nav_bar.dart';
import 'package:my_flutter_project/widgets/exercise_card.dart';
import 'package:my_flutter_project/widgets/search_bar.dart';

class ExerciseScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height *.45,
            decoration: BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/exercise_bg.png"),
                fit: BoxFit.fitWidth,
              ),
            )
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: size.height * 0.05),
                  SizedBox(height: 10),
                  Text(
                    "Exercise",
                    style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 10),
                  Text("3-10 MIN Course", style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 10),
                  SizedBox(
                    width: size.width * .6,
                    child: 
                    Text("Transform your body, transform your life. Unlock your strength, unlock your greatness.",
                    ),
                    ),
                    SizedBox(
                      width: size.width * .5,
                      child: SearchBar_()),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: <Widget>[
                          ExercsieCard(
                            exercise_name: 'Chest',
                            press: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Chest()));
                            },
                          ),
                          ExercsieCard(
                            exercise_name: 'Back',
                            press: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Back()));
                            },
                          ),
                          ExercsieCard(
                            exercise_name: 'Arms',
                            press: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Arms()));
                            },
                          ),
                          ExercsieCard(
                            exercise_name: 'Shoulders',
                            press: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Shoulders()));
                            },
                          ),
                          ExercsieCard(
                            exercise_name: 'Legs',
                            press: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Legs()));
                            },
                          ),
                          ExercsieCard(
                            exercise_name: 'Abs',
                            press: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Abs()));
                            },
                          ),
              ],
                      ),
                      SizedBox(height: 20),
                      Text("Exercise", style: 
                      Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 17),
                              blurRadius: 23,
                              spreadRadius: -13,
                              color: kShadowColor,
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            FaIcon(Icons.play_arrow, color: kBlueColor, size: 50,),
                            SizedBox(width: 20),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text("Basic 2",
                                style: Theme.of(context).textTheme.subtitle1,),
                              ],
                            )
                            ),
                            Padding(padding: EdgeInsets.all(10),
                            child: FaIcon(Icons.lock_outline, color: Colors.black, size: 30,)
                            )
                            ]
                        ),
                      )
                ],
              ),
            )
      )
      ],
      ),
    );
  }
}

