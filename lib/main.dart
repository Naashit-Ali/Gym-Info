// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_project/SplashPage.dart';
import 'package:my_flutter_project/constants.dart';
import 'package:my_flutter_project/screens/diet_screen.dart';
import 'package:my_flutter_project/screens/guide_screen.dart';
import 'package:my_flutter_project/screens/meditation_screen.dart';
import 'package:my_flutter_project/screens/exercise_screen.dart';
import 'package:my_flutter_project/screens/signin_screen.dart';
import 'package:my_flutter_project/widgets/bottom_nav_bar.dart';
import 'package:my_flutter_project/widgets/category_card.dart';
import 'package:my_flutter_project/widgets/search_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var auth = FirebaseAuth.instance;
  var isLogin = false;

  checkIfLogin() async {
    auth.authStateChanges().listen((User? user){
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
      } 
    });
  }
  @override
  void initState() {
    checkIfLogin();
    super.initState();
    }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medi App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: isLogin ? HomeScreen() : SplashPage(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    String? displayName = FirebaseAuth.instance.currentUser?.displayName ?? "user";
    List<String> nameParts = displayName.split(" ");
    String capitalizedDisplayName = nameParts.map((part) => part.substring(0, 1).toUpperCase() + part.substring(1)).join(" ");

    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavBar() ,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),),)
                
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: FaIcon(FontAwesomeIcons.signOut, size: 20,),
                        onPressed: () {
                          FirebaseAuth.instance.signOut().then((value) {
                          print("Signed Out");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SignInScreen()));
                        });
                        },
                      ),
                  ),
                  ),
                  Text(
                    "Good Morning \n$capitalizedDisplayName",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w900),
                        
                  ),
                  SearchBar_(),
                    Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          assetName: "assets/images/1.png",
                          title: "Diet",
                          press: (){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context)
                            {
                              return DietScreen();})
                              );
                          },
                        ),
                        CategoryCard(
                          assetName: "assets/images/2.png",
                          title: "Guide",
                          press: (){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context)
                            {
                              return Guide();})
                              );
                          },
                        ),
                        CategoryCard(
                          assetName: "assets/images/3.png",
                          title: "Meditation",
                          press: (){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context)
                            {
                              return MeditationScreen();})
                              );
                          },
                        ),
                        CategoryCard(
                          assetName: "assets/images/4.png",
                          title: "Exercises",
                          press: (){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context)
                            {
                              return ExerciseScreen();})
                              ,);
                          },
                        ),  
                                            
                     ],),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

