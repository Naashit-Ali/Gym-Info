import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_project/constants.dart';
import 'package:my_flutter_project/screens/diet_screen/diet_all_screen.dart';
import 'package:my_flutter_project/widgets/bottom_nav_bar.dart';
import 'package:my_flutter_project/widgets/search_bar.dart';
import 'package:my_flutter_project/widgets/session_card.dart';

class DietScreen extends StatelessWidget{
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
                image: AssetImage("assets/images/5.png"),
                fit: BoxFit.fill
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
                    "Diet",
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
                    Text("Fuel your gains, nourish your body. The power of nutrition in every bite.",
                    ),
                    ),
                    SizedBox(
                      width: size.width * .5,
                      child: SearchBar_()),
                      SizedBox(height: 20),
                      StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('diet')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      final exercises = snapshot.data!.docs;
                      return Wrap(
                        runSpacing: 20,
                        spacing: 20,
                        children: exercises.map((exercise) {
                          return SeassionCard(
                            seassionNum: exercise["name"],
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DietAll(exerciseId: exercise.id);
                                  },
                                ),
                              );
                            },
                          );
                        }).toList(),
                      );
                    },
                  ),
                      SizedBox(height: 20),
                      Text("Meditation", style: 
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

