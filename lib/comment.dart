
// import 'package:flutter/material.dart';
// import 'package:my_flutter_project/ui_helper/util.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         textTheme: TextTheme(
//           bodyText1: TextStyle(fontSize: 20, color: Colors.red),
//           bodyText2: TextStyle(fontSize: 20, color: Colors.green),
//         ),
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   final List<String> arr = ['nasir', 'yasir', 'ali', 'ahmed', 'kamran', 'kashif', 'khalid'];
//   var emailtext = TextEditingController();
//   var passwordtext = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(child: Container(
//         width: 200,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               keyboardType: TextInputType.emailAddress,
//               controller: emailtext,
//               decoration: InputDecoration(
//                 hintText: "email",
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(21),
//                   borderSide: BorderSide(
//                     color: Colors.blue,
//                     width: 2,
//                   ),
//                 ),  enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(21),
//                   borderSide: BorderSide(
//                     color: Colors.grey,
//                     width: 2,
//                   ),
//                 ),
                
//                 prefixIcon: IconButton(
//                   icon: Icon(Icons.email, color: Colors.grey,),
//                   onPressed: () {
                    
//                   },),
//                 )
//                ),

//                Container(
//                  height: 20,
//                ),
//                TextField(
//                 controller: passwordtext,
//                 obscureText: true,
//                 obscuringCharacter: "*",
//               decoration: InputDecoration(
//                 hintText: "password",
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(21),
//                   borderSide: BorderSide(
//                     color: Colors.blue,
//                     width: 2,
//                   ),
//                 ),  enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(21),
//                   borderSide: BorderSide(
//                     color: Colors.grey,
//                     width: 2,
//                   ),
//                 ),
//                 prefixIcon: Icon(Icons.lock, color: Colors.grey,),
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.remove_red_eye, color: Colors.grey,),
//                   onPressed: () {
//                   },),  
              
//                 )
//                ),
//                Container(
//                  height: 20,
//                ),
//                ElevatedButton(onPressed: (() {
//                   print(emailtext.text);
//                   print(passwordtext.text);
//                }), child: Text('Login')),
//           ],
//         ),
//         ),
//       )

//     );
//   }}

///////////////////////////////////////////
///
///
///import 'package:flutter/material.dart';
// import 'package:my_flutter_project/IntroPage.dart';
// import 'package:my_flutter_project/SplashPage.dart';
// import 'package:my_flutter_project/widgets/rounded_btn.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       home: SplashPage(),
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   var n_1 = TextEditingController();
//   var n_2 = TextEditingController();
//   var na ;

//   var result = "";



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stateful Widget Example'),
//       ),
//       body: Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Welcome $na", style: TextStyle(fontSize: 25),),
//               Container(
//                 width: 200,
//                 child: TextField(
//                   keyboardType: TextInputType.number,
//                   controller: n_1,
//                   decoration: InputDecoration(
//                     hintText: "Enter Number 1",
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(21),
//                       borderSide: BorderSide(
//                         color: Colors.blue,
//                         width: 2,
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(21),
//                       borderSide: BorderSide(
//                         color: Colors.red,
//                         width: 2,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 20,
//               ),
//               Container(
//                 width: 200 ,
//                 child: TextField(
//                   keyboardType: TextInputType.number,
//                   controller: n_2,
//                   decoration: InputDecoration(
//                     hintText: "Enter Number 2",
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(21),
//                       borderSide: BorderSide(
//                         color: Colors.blue,
//                         width: 2,
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(21),
//                       borderSide: BorderSide(
//                         color: Colors.red,
//                         width: 2,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
              
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(onPressed: (){
//                     var n1 = int.parse(n_1.text.toString());
//                     var n2 = int.parse(n_2.text.toString());
//                     var sum = n1 + n2;
//                     result = "Sum of $n1 and $n2 is : $sum";
//                     setState(() {});
//                   },

//                    child: FaIcon(FontAwesomeIcons.plus)),

//                    ElevatedButton(onPressed: (){
//                     var n1 = int.parse(n_1.text.toString());
//                     var n2 = int.parse(n_2.text.toString());
//                     var sub = n1 - n2;
//                     result = "Sub of $n1 and $n2 is : $sub";
//                     setState(() {});
//                    },
//                    child: Text('Sub')),
//                    ElevatedButton(onPressed: (){
//                     var n1 = int.parse(n_1.text.toString());
//                     var n2 = int.parse(n_2.text.toString());
//                     var mul = n1 * n2;
//                     result = "Mul of $n1 and $n2 is : $mul";
//                     setState(() {});
//                    },
//                    child: Text('Mul')),
//                    ElevatedButton(onPressed: (){
//                     var n1 = int.parse(n_1.text.toString());
//                     var n2 = int.parse(n_2.text.toString());
//                     var div = n1 / n2;
//                     result = "Div of $n1 and $n2 is : $div";
//                     setState(() {});
//                    },
//                    child: Text('Div')),
//                 ],
//               ),
//               Padding(padding: EdgeInsets.all(20),
//               child: Text(result, 
//               style: TextStyle(fontSize: 20, color: Colors.black), )
//               ),
//             ],
//         ),)
//     ));
//   }
// }

// class MyStatelessWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stateless Widget Example'),
//       ),
//       body: Center(
        
//       ),
//     );
//   }
// }
///////////////////////////////////////////