import 'package:flutter/material.dart';
import 'package:inshorts/secongpage.dart';
import 'package:inshorts/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> l = [Secondpage(), settings()];
  int current_index = 0;
  void tapped(int index) {
    setState(() {
      current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: l[current_index],
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 50.0,
              color: Colors.yellow,
            ),
            ListTile(
              title: Text("Logout"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Inshorts'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current_index,
        onTap: tapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('settings'))
        ],
      ),
    );
  }
}
