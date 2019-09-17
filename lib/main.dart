import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_management_ui/task_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<String> items = ['Office Supply', 'Dribbble', 'University', 'Personal'];
List<Color> colors = [Colors.blue[800], Color(0xFFffe5b4), Colors.red];
List<int> days = [4,5,6,7,8,9,10];
List<String> daysNames = ['Wed', 'Thu', 'Fri', 'Sat', 'Sun', 'Mon', 'Tue'];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 15.0, top: 30.0, bottom: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'September',
                    style: TextStyle(
                      color: Color(0xFF00003f),
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 70.0,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 55.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: index == 0 ? Color(0xFF00003f) :  Color(0xFFffe5b4),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                days[index].toString(),
                                style: TextStyle(
                                    color: index == 0 ? Colors.white : Color(0xFF00003f),
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                daysNames[index],
                                style: TextStyle(
                                    color: index == 0 ? Colors.white: Color(0xFF00003f),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 15.0,
                        );
                      },
                      itemCount: days.length,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(30.0)),
                      color: Color(0xFF00003f),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0, top: 30.0),
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return TaskCard(
                          number: (index+1).toString(),
                          item: items[index],
                          backgrClr: colors[(index % colors.length)],
                          firstCircle: colors[(index+1) % colors.length],
                          secondCircle: colors[(index+2) % colors.length],
                        );
                      },
                      separatorBuilder: ( BuildContext context, int index ) { return SizedBox(height: 40.0,); },
                      itemCount: 4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.quadraticBezierTo(size.width, 0.0, size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => true;
}
