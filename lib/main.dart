import 'package:flutter/material.dart';
// import 'package:techshiksha_student/screens/navigation_screen.dart';
import 'student_screens/main_screen.dart';
import 'student_screens/subjects.dart';
import 'student_screens/nav.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
        initialRoute: '.',
        routes: {
          '.':(context) => MainScreen(),
          '/science': (context) => SubjectViewModel(),
          '/navscreen':(context)=>NavigationScreen()
        },
    );
  }
}