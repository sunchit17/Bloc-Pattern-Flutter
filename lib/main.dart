import 'package:flutter/material.dart';
import 'bloc.dart';

void main() {
  runApp(MaterialApp(
    title: 'Bloc in Flutter',
    home: MyHome(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Admin'),
              accountEmail: Text('abc@example.com'),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pop();

                bloc1.updateNavigation("Home");
              },
            ),
            ListTile(
              title: Text("PageOne"),
              onTap: () {
                Navigator.of(context).pop();

                bloc1.updateNavigation("PageOne");
              },
            ),
            ListTile(
              title: Text("PageTwo"),
              onTap: () {
                Navigator.of(context).pop();

                bloc1.updateNavigation("PageTwo");
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: bloc1.getNavigation,
        initialData: bloc1.navigationProvider.currentNavigation,
        builder: (context, snapshot) {
          if (bloc1.navigationProvider.currentNavigation == "Home") {
            return Home();
          }
          if (bloc1.navigationProvider.currentNavigation == "PageOne") {
            return PageOne();
          }
          if (bloc1.navigationProvider.currentNavigation == "PageTwo") {
            return PageTwo();
          }
        },
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        alignment: Alignment(0, 0),
        child: Text(
          "Home",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        color: Colors.blue,
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        alignment: Alignment(0, 0),
        child: Text(
          "PageOne",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        color: Colors.purple,
      ),
    );
  }
}

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        alignment: Alignment(0, 0),
        child: Text(
          "PageTwo",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        color: Colors.green,
      ),
    );
  }
}
