import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:techshiksha_student/student_screens/attendance.dart';
import 'package:techshiksha_student/student_screens/testscores.dart';
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

class MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  // TabController tabController;
  // ScrollController scrollController;

  // void initState() {
  //   super.initState();
  //   tabController = new TabController(vsync: this , length: 3);
  //   scrollController = new ScrollController();
  // }
  @override
  Widget build(BuildContext context) {
    // var em = '${'name'}';
    // var em = "${widget.user}";
    return Scaffold(
      body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Color(
                      0xFFE1306C,
                    ),
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: false,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: false,
                        title: Text("Hello\nRitik Rathi!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            )),
                        background: DecoratedBox(
                          decoration: new BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Color(0xFFE1306C),
                                Color(0xFF833ab4)
                              ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                        )),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        indicatorColor: Color(0xFFE1306C),
                        labelColor: Colors.black87,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            icon: Icon(Icons.home),
                            text: 'Home',
                          ),
                          Tab(
                            icon: Icon(Icons.calendar_today),
                            text: "Attendance",
                          ),
                          Tab(
                            icon: Icon(Icons.lightbulb_outline),
                            text: "Test Score",
                          )
                        ],
                      ),
                    ),
                    pinned: false,
                  ),
                ];
              },
              body: TabBarView(
                children: <Widget>[HomeScreen(), Attendance(), TestScore()],
              ))),
    );
  }
}

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(                
                image: new DecorationImage(
                    image: AssetImage('assets/science.png'),
                    fit: BoxFit.cover)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:2.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: new Container(
              width: double.infinity,
              height: 200.0,
              decoration: new BoxDecoration(
                color:Colors.grey.withOpacity(0.3),
              ),
              child: SubjectViewModel(
                subject: subjects[0],
              ),
            ),
          ),
        )
      ]),
      new SizedBox(
        height: 10.0,
      ),
      Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(                
                image: new DecorationImage(
                    image: AssetImage('assets/maths.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:2.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: new Container(
              width: double.infinity,
              height: 200.0,
              decoration: new BoxDecoration(
                color:Colors.grey.withOpacity(0.3),
              ),
              child: SubjectViewModel(
                subject: subjects[1],
              ),
            ),
          ),
        )
      ]),
      new SizedBox(
        height: 10.0,
      ),
     Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(                
                image: new DecorationImage(
                    image: AssetImage('assets/history.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:2.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: new Container(
              width: double.infinity,
              height: 200.0,
              decoration: new BoxDecoration(
                color:Colors.grey.withOpacity(0.3),
              ),
              child: SubjectViewModel(
                subject: subjects[2],
              ),
            ),
          ),
        )
      ]),
      new SizedBox(
        height: 10.0,
      ),
      Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Opacity(
            opacity: 0.5,
            child: Container(
              width: double.infinity,
              height: 150.0,
              decoration: BoxDecoration(
                  // color: Colors.white54,
                  image: new DecorationImage(
                      image: AssetImage('assets/civics.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
        Positioned(
          top: 50.0,
          left: 50.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SubjectViewModel(
                subject: subjects[3],
              ),
            ],
          ),
        ),
      ]),
      new SizedBox(
        height: 10.0,
      ),
    Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(                
                image: new DecorationImage(
                    image: AssetImage('assets/geo.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:2.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: new Container(
              width: double.infinity,
              height: 200.0,
              decoration: new BoxDecoration(
                color:Colors.grey.withOpacity(0.3),
              ),
              child: SubjectViewModel(
                subject: subjects[4],
              ),
            ),
          ),
        )      
      ]),
      new SizedBox(
        height: 10.0,
      ),
         Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(                
                image: new DecorationImage(
                    image: AssetImage('assets/hindi.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:2.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: new Container(
              width: double.infinity,
              height: 200.0,
              decoration: new BoxDecoration(
                color:Colors.grey.withOpacity(0.3),
              ),
              child: SubjectViewModel(
                subject: subjects[5],
              ),
            ),
          ),
        )      
      ]),
      new SizedBox(
        height: 10.0,
      ),
       Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(                
                image: new DecorationImage(
                    image: AssetImage('assets/English.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:2.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: new Container(
              width: double.infinity,
              height: 200.0,
              decoration: new BoxDecoration(
                color:Colors.grey.withOpacity(0.3),
              ),
              child: SubjectViewModel(
                subject: subjects[6],
              ),
            ),
          ),
        )      
      ]),
      new SizedBox(
        height: 10.0,
      ),
     Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(                
                image: new DecorationImage(
                    image: AssetImage('assets/french.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:2.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: new Container(
              width: double.infinity,
              height: 200.0,
              decoration: new BoxDecoration(
                color:Colors.grey.withOpacity(0.3),
              ),
              child: SubjectViewModel(
                subject: subjects[7],
              ),
            ),
          ),
        )      
      ]),
      new SizedBox(
        height: 10.0,
      ),
    ]);
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
