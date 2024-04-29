import 'package:flutter/material.dart';
import 'package:my_flutter_project/screens/signin_screen.dart';



class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 3), () {
  //     Navigator.pushReplacement(context, 
  //     MaterialPageRoute(builder: (context) => HomeScreen()));
  //   });
  //   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 70,
          left: 30,
          right: 30,
        child: 
        ElevatedButton(
          onPressed: (){
          Navigator.pushReplacement(context, 
          MaterialPageRoute(builder: (context) => SignInScreen()));
        }, 
        child: 
        Text('TRAIN NOW',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),

        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 196, 255, 33),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        ),
        ),
        ],
        )
    );
  }
}