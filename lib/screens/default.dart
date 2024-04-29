import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_project/constants.dart';
// import 'package:my_flutter_project/widgets/bottom_nav_bar.dart';
import 'package:my_flutter_project/widgets/timer.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

class Default extends StatelessWidget {
  // Widget _buildVideoPlayer() {
  //   VideoPlayerController videoPlayerController =
  //       VideoPlayerController.networkUrl(Uri.parse(
  //           'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'
  //       ));
  //   ChewieController chewieController = ChewieController(
  //     videoPlayerController: videoPlayerController,
  //     aspectRatio: 16 / 9, // Adjust aspect ratio as needed
  //     autoInitialize: true,
  //     looping: true,
  //   );
  //   return Chewie(controller: chewieController);
  // }
  final String exercise_name;
  final Function next_screen;
  final Image image;
  final String description;

  const Default(
    {Key? key, 
    required this.exercise_name,
    required this.next_screen,
    required this.image,
    required this.description
    })
     : super(key: key);
  @override
  Widget build(BuildContext context) { 
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: 710,
            decoration: BoxDecoration(
              color: kBlueLightColor,
              // image: DecorationImage(
              //   image: AssetImage("assets/images/exercise_bg.png"),
              //   fit: BoxFit.fitWidth,
              // ),
            ),
          ),
          Positioned(
            top: 90, right: 20,
            child: IconButton(
              icon: FaIcon(FontAwesomeIcons.solidCircleCheck),
              iconSize: 40,
              onPressed: () => next_screen(),
            )
           ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: size.height * 0.05),
                  Text(
                    exercise_name,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 30),
                  Wrap(
                    // spacing: 40,
                    runSpacing: 20,
                    children: <Widget>[
                      Stack(
                        children: [
                          Container(
                            width: 500,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child:
                            //  _buildVideoPlayer() 
                            image,
                            
                          ),
                        ],
                      ),
                      Text(
                        "Description",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      Container(
                        width: 500,
                        height: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          //color: Colors.black.withOpacity(0.7),
                        ),
                        child: Text(
                          description,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        width: 500,
                        height: 190,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          //  color: Colors.black.withOpacity(0.7),
                        ),
                        child: MyExerciseTimer(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
