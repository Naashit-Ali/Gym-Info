import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_project/constants.dart';

class GuideCard extends StatelessWidget {
  final String exercise_name;
  final bool isDone;
  final String description;
  const GuideCard({
    Key? key,
    required this.exercise_name,
    this.isDone = false,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Container(
            width: double.infinity,
            // padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                     // Remove the parentheses
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                    //     Container(
                    //       height: 60,
                    //       width: 43,
                    //       decoration: BoxDecoration(
                    //         color: isDone ? kBlueColor : Colors.white,
                    //         shape: BoxShape.circle,
                    //         border: Border.all(color: kBlueColor),
                    //     ),
                    //     child: Icon(FontAwesomeIcons.dumbbell, 
                    //     color: isDone ? Colors.white : kBlueColor,),
                    // ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Set text alignment to left
                      children: [
                        Text(exercise_name,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                        ),
                        Container(height: 10,),
                        Container(
                        width: 345,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          //color: Colors.black.withOpacity(0.7),
                        ),
                        child: Text(
                          description, style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 20,  ),
                          
                        ),
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
