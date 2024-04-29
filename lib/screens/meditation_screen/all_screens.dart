import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_player/video_player.dart';
import 'package:my_flutter_project/widgets/medi_widget.dart';

class MyHomePagee extends StatefulWidget {
  final String exerciseId;

  const MyHomePagee({Key? key, required this.exerciseId}) : super(key: key);

  @override
  State<MyHomePagee> createState() => _MyHomePageeState();
}

class _MyHomePageeState extends State<MyHomePagee> {
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
        stream: FirebaseFirestore.instance.collection('meditation').doc(widget.exerciseId).snapshots(),
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
          return MediWidget(
            exercise_name: "${currentExercise["name"]}",
            next_screen: () {
              setState(() {
                // No need to iterate through exercises when using specific exercise ID
                allExercisesDisplayed = true; // Mark all exercises as displayed
              });
            },
            videoPlayerController: VideoPlayerController.network(currentExercise["video_url"]),
            description: "${currentExercise["description"]}",
          );
        },
      ),
    );
  }
}