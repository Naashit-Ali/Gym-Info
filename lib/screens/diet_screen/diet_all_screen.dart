import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_flutter_project/constants.dart';
import 'package:my_flutter_project/widgets/diet_widget.dart';

class DietAll extends StatefulWidget {
  final String exerciseId;

  const DietAll({Key? key, required this.exerciseId, required }) : super(key: key);

  @override
  _DietAll createState() => _DietAll();
}

class _DietAll extends State<DietAll> {
  late DocumentSnapshot currentExercise;
  late bool allExercisesDisplayed;

  @override
  void initState() {
    super.initState();
    allExercisesDisplayed = false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 1000,
            decoration: BoxDecoration(
              color: kBlueLightColor,
            ),
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
                    "Chest",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 20),
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection('diet').doc(widget.exerciseId).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          currentExercise = snapshot.data!;
          if (allExercisesDisplayed) {
            // If all exercises have been displayed, navigate to the HomeScreen
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pop(context);
            });
            return Container(); // Return an empty container while navigating
          }
          return DietWidget(
            exercise_name: "${currentExercise["name"]}",
           press: (){},
          );
        },
      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
