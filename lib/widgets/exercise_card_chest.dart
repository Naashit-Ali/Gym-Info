import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_project/constants.dart';

class ExercsieCardChest extends StatelessWidget {
  final String exercise_name;
  final bool isDone;
  final Function press;
  const ExercsieCardChest({
    Key? key,
    required this.exercise_name,
    this.isDone = false,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Container(
            width: 500,
            // padding: EdgeInsets.all(16),
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
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => press(), // Remove the parentheses ()
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 43,
                          decoration: BoxDecoration(
                            color: isDone ? kBlueColor : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: kBlueColor),
                        ),
                        child: Icon(FontAwesomeIcons.dumbbell, 
                        color: isDone ? Colors.white : kBlueColor,),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Set text alignment to left
                      children: [
                        Text(exercise_name,
                        style: Theme.of(context).textTheme.headline5,
                        ),
                        Container(height: 10,),
                        Row(
                          children: [
                            Text("3 sets", style: TextStyle(
                              fontSize: 16,
                            ), 
                             ),
                             Container(
                              width: 20,
                             ),
                             Text("15 reps", style: TextStyle(
                              fontSize: 16,
                            ), 
                             ),

                          ],
                        ),
                      ],
                    ),
                    
                    ],
                          ),
                  ),
                ),
              ),
              ),
        );
      }
    );
  }
}
