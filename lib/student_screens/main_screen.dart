import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'subjects.dart';
import 'package:techshiksha_student/bottom_navbar2.dart';
import 'package:firebase_auth/firebase_auth.dart';

String sub = '';
Color color1, color2;

class MainScreen extends StatefulWidget {
  const MainScreen({Key key, this.user}) : super(key: key);
  // final FirebaseUser user;
  final String user;
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  var name, standard, section, email;
  void getdata(enrollment) {
    var documnet =
        Firestore.instance.collection('/students').document(enrollment);
    documnet.get().then((snp) {
      var data = snp.data;
      name = data['name'];
      standard = data['class'];
      email = data['email'];
      print(standard);
    });
    print("awesome");

  }

  @override
  Widget build(BuildContext context) {
    var em = "${widget.user}";
    getdata(em);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 150),
        child: new Container(
          height: 150.0,
          width: double.infinity,
          decoration: new BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.teal, Colors.white])),
          child: Stack(
            children: <Widget>[
              new Positioned(
                top: 20.0,
                left: 20.0,
                child: new Text('Hello!',
                    style: new TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold)),
              ),
              new Positioned(
                top: 60.0,
                left: 20.0,
                child: new Text(name,
                    style: new TextStyle(
                        fontSize: 40.0, fontWeight: FontWeight.bold)),
              ),

              //circle

              new Positioned(
                top: 0.0,
                left: 10.0,
                child: Container(
                  height: 300.0,
                  width: 300.0,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(150.0),
                      color: Colors.white12),
                ),
              ),
              new Positioned(
                bottom: 20.0,
                right: 10.0,
                child: Container(
                  height: 300.0,
                  width: 300.0,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(150.0),
                      color: Colors.white10),
                ),
              ),
              Positioned(
                  top: 20.0,
                  right: 20.0,
                  child: Container(
                      height: 100,
                      width: 100,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(150.0),
                          image: DecorationImage(
                              image: AssetImage('assets/ritik.jpeg'),
                              fit: BoxFit.cover))))
            ],
          ),
        ),
      ),
      bottomNavigationBar: FlipBoxBar(
        items: [
          FlipBarItem(
              icon: new Image.asset('assets/profile.png',
                  height: 30.0, width: 30.0),
              text: Text("Profile"),
              frontColor: Colors.teal[100],
              backColor: Colors.teal[300]),
          FlipBarItem(
              icon: new Image.asset('assets/attendance.png',
                  height: 30.0, width: 30.0),
              text: Text("Attendance"),
              frontColor: Colors.teal[100],
              backColor: Colors.teal[300]),
          FlipBarItem(
              icon: new Image.asset('assets/testscore.png',
                  height: 30.0, width: 30.0),
              text: Text("Scores"),
              frontColor: Colors.teal[100],
              backColor: Colors.teal[300]),
          //FlipBarItem(icon: Icon(Icons.print), text: Text("Print"), frontColor: Colors.teal[100], backColor: Colors.teal[300]),
          //FlipBarItem(icon: Icon(Icons.print), text: Text("Print"), frontColor: Colors.teal[100], backColor: Colors.teal[300]),
        ],
        onIndexChanged: (newIndex) {
          print(newIndex);
        },
      ),
      // appBar: new AppBar(
      //   title: Text('SUBJECTS'),
      // ),
      // drawer: Drawer1(),
      body: new ListView(children: <Widget>[
       

        // iconbuttons for various subjects

        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: SubjectViewModel(
                subject: subjects[0],
              )),
              Expanded(
                child: SubjectViewModel(
                  subject: subjects[1],
                ),
              )
            ],
          ),
        ),
        new SizedBox(
          height: 10.0,
        ),
        new Row(
          children: <Widget>[
            Expanded(
                child: SubjectViewModel(
              subject: subjects[2],
            )),
            Expanded(
              child: SubjectViewModel(
                subject: subjects[3],
              ),
            )
          ],
        ),
        new SizedBox(
          height: 10.0,
        ),
        new Row(
          children: <Widget>[
            Expanded(
                child: SubjectViewModel(
              subject: subjects[5],
            )),
            Expanded(
              child: SubjectViewModel(
                subject: subjects[5],
              ),
            )
          ],
        ),
        new SizedBox(
          height: 10.0,
        ),
        new Row(
          children: <Widget>[
            Expanded(
                child: SubjectViewModel(
              subject: subjects[6],
            )),
            Expanded(
              child: SubjectViewModel(
                subject: subjects[7],
              ),
            )
          ],
        ),
      ]),

    );
  }
}
