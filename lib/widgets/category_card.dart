import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String assetName; // Change the type to String
  final String title;
  final Function press;

  const CategoryCard({
    Key? key,
    required this.assetName, // Update the parameter type
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: 90, // Adjust the spread radius as needed
              color: Colors.black.withOpacity(0.2),
            )
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => press(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Image.asset( // Use Image.asset to load the image from assets
                    assetName, // Use the provided assetName
                    height: 100,
                    width: 100,
                    // Adjust the size of the image as needed
                  ),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
