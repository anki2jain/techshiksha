import 'package:flutter/material.dart';

class EntryScreen extends StatefulWidget {
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> with SingleTickerProviderStateMixin{

  AnimationController fadeAnimationController;
  Animation fadeAnimation;

  void initState() { 
    super.initState();
    fadeAnimationController = new AnimationController(vsync: this , duration: Duration(seconds: 2));
    fadeAnimation = new CurvedAnimation(curve: Curves.easeInCirc , parent: fadeAnimationController);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    fadeAnimationController.forward();
    return FadeTransition(
      opacity: fadeAnimation,
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/home');
            },
                      child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height >= 775.0
                ? MediaQuery.of(context).size.height
                : 775.0,
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                    colors: [Color(0xFFE1306C), Color(0xFF833ab4)])),
            child: Center(
              child: Image(
                width: 200.0,
                height: 200.0,
                image: AssetImage('assets/logo.png'),
              ),
            )),
          ),
    );
  }
}
