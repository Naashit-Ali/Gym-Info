
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_project/constants.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class MediWidget extends StatelessWidget {
  final String exercise_name;
  final Function next_screen;
  final VideoPlayerController videoPlayerController;
  final String description;

  const MediWidget({
    Key? key,
    required this.exercise_name,
    required this.next_screen,
    required this.videoPlayerController,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 710,
            decoration: BoxDecoration(
              color: kBlueLightColor,
            ),
          ),
          Positioned(
            top: 90,
            right: 20,
            child: IconButton(
              icon: FaIcon(FontAwesomeIcons.solidCircleCheck),
              iconSize: 40,
              onPressed: () => next_screen(),
            ),
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
                            child: Chewie(
                              controller: ChewieController(
                                videoPlayerController: videoPlayerController,
                                autoPlay: true,
                                looping: true,
                                aspectRatio: 16 / 9,
                                errorBuilder: (context, errorMessage) {
                                  return Center(
                                    child: Text(
                                      errorMessage,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  );
                                },
                              ),
                            ),
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
