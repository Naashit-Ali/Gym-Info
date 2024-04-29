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

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final List<String> arr = ['nasir', 'yasir', 'ali', 'ahmed', 'kamran', 'kashif', 'khalid'];
//   late TextEditingController emailController;
//   late TextEditingController passwordController;

//   @override
//   void initState() {
//     super.initState();
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var time = DateTime.now(); 
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//           Text('Select date', style: TextStyle(fontSize: 25),),
//           ElevatedButton(onPressed: () async{
//             DateTime? selectedDate = await showDatePicker(
//               context: context,
//               initialDate: DateTime.now(),
//               firstDate: DateTime(2000),
//               lastDate: DateTime(2025),
//             );
//             if (selectedDate != null) {
//               print(selectedDate);
//             }
//             }, child: Text('Select Date')),
//             ElevatedButton(onPressed: () async{
//               TimeOfDay? selectedTime = await showTimePicker(
//                 context: context,
//                 initialTime: TimeOfDay.now(),
//                 initialEntryMode: TimePickerEntryMode.input
//               );
//               if (selectedTime != null) {
//                 print(selectedTime);
//               }
//             }, child: Text('Select Time'))
          
//         ],),
//       )
//     );
//   }
// }

/////////////////////////////  lib/main.dart  ///////////////////////////////
///
///import 'package:flutter/material.dart';
// import 'package:my_flutter_project/IntroPage.dart';
// import 'package:my_flutter_project/ProfilePage.dart';
// import 'package:my_flutter_project/SplashPage.dart';
// import 'package:my_flutter_project/widgets/rounded_btn.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({ Key? key }) : super(key: key);
//   @override

//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.indigo,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: SplashPage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({ Key? key }) : super(key: key);
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
//   }

// class _MyHomePageState extends State<MyHomePage> {
//   var wtController = TextEditingController();
//   var ftController = TextEditingController();
//   var inController = TextEditingController();
//   var result ="";
//   var bgColor = Colors.indigo[100];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('BMI'),
//       ),
//       body: Container(
//         color: bgColor,
//         child: Center(
//           child: Container(
//             width: 300,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//               Text("BMI", style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold
//               ),),
//               TextField(
//                 controller: wtController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   hintText: "Enter Weight in KG",
//                   label: Text("Enter your weight in kg"),
//                   prefixIcon: Icon(Icons.line_weight),
//                 ),),

//                 SizedBox(height: 12,),

//                 TextField(
//                 controller: ftController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   hintText: "Enter your height in feet",
//                   label: Text("Enter your height in feet"),
//                   prefixIcon: Icon(Icons.height),
//                 ),),

//                 SizedBox(height: 12,),
//                 TextField(
//                 controller: inController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   hintText: "Enter height in inches",
//                   label: Text("Enter your height in inches"),
//                   prefixIcon: Icon(Icons.height),
//                 ),),
//                 SizedBox(height: 12,),

//                 ElevatedButton(onPressed: (){
//                   var wt = wtController.text.toString();
//                   var ft = ftController.text.toString();
//                   var inch = inController.text.toString();

//                   if(wt!="" && ft!="" && inch!=""){
//                     var iwt = int.parse(wt);
//                     var ift = int.parse(ft);
//                     var iinch = int.parse(inch);

//                     var tinch = (ift*12) + iinch;
//                     var tcm = tinch * 2.54;
//                     var tcm2 = tcm/100;
//                     var bmi = iwt / (tcm2*tcm2);

//                     var msg = "";

//                     if(bmi>25){
//                       msg = "You are overweight.";
//                       bgColor = Colors.red[200];
//                     }
//                     else if(bmi<18){
//                       msg = "You are underweight.";
//                       bgColor = Colors.yellow[200];
//                     }
//                     else{
//                       msg = "You are normal.";
//                       bgColor = Colors.green[200];
//                     }
//                     setState(() {
//                       result = "$msg \n Your BMI is ${bmi.toStringAsFixed(2)}";
//                     });
//                   }
//                   else{
//                     setState(() {
//                       result = "Please enter all the fields";
//                     });

//                   }
//                 },
                
                
//                  child: Text("Calculate BMI"),),
//                  SizedBox(height: 12,),

//                  Text(result, style: TextStyle(
//                    fontSize: 25,
//                  ),)
//             ],),
//           ),
//         ),
//       ) 
//       );
//   }
// }


  