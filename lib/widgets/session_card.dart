import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_flutter_project/constants.dart';


class SeassionCard extends StatelessWidget {
  final String seassionNum;
  final bool isDone;
  final Function press;
  const SeassionCard({
    Key? key,
    required this.seassionNum,
    this.isDone = false,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Container(
            width: constraint.maxWidth / 2 - 10,
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
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 42,
                          width: 43,
                          decoration: BoxDecoration(
                            color: isDone ? kBlueColor : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: kBlueColor),
                        ),
                        child: Icon(Icons.play_arrow, 
                        color: isDone ? Colors.white : kBlueColor,),
                    ),
                    SizedBox(width: 10),
                    Text("$seassionNum",
                    style: Theme.of(context).textTheme.subtitle1,
                    )
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
