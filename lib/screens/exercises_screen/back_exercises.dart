import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_project/screens/default.dart';

class BackExercises extends StatefulWidget {
  final String exerciseId;

  const BackExercises({Key? key, required this.exerciseId, required }) : super(key: key);

  @override
  _BackExercisesState createState() => _BackExercisesState();
}

class _BackExercisesState extends State<BackExercises> {
  late DocumentSnapshot currentExercise;
  late bool allExercisesDisplayed;

  @override
  void initState() {
    super.initState();
    allExercisesDisplayed = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('exercise').doc(widget.exerciseId).snapshots(),
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
          return Default(
            exercise_name: "${currentExercise["ex"]}", 
            next_screen: () {
              setState(() {
                // No need to iterate through exercises when using specific exercise ID
                allExercisesDisplayed = true; // Mark all exercises as displayed
              });
            },
            image: Image.network(currentExercise["img_url"], fit: BoxFit.cover,),
            description: "Sets: 3 \nReps: 20\n\n${currentExercise["description"]}",
          );
        },
      ),
    );
  }
}