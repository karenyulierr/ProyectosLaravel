import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:pruebaapiflutter/view/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Codigo Alpha Flutter",
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData(
        accentColor: Colors.white70
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Codigo Alpha Flutter", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
            },
            child: Text("Log Out", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Center(child: Text("Main Page")),
      drawer: Drawer(
        child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text('Ejercicios'),
                  accountEmail: new Text('codigoalphacol@gmail.com'),
                  // decoration: new BoxDecoration(
                  //   image: new DecorationImage(
                  //     fit: BoxFit.fill,
                  //    // image: AssetImage('img/estiramiento.jpg'),
                  //   )
                  // ),
                ),
                new Divider(),
                // new ListTile(
                //   title: new Text("Add data"),
                //   trailing: new Icon(Icons.fitness_center),
                //   onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                //     builder: (BuildContext context) => AddData(),
                //   )),
                // ),
                // new Divider(),
                // new ListTile(
                //   title: new Text("Mostrar listado"),
                //   trailing: new Icon(Icons.help),
                //   onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                //     builder: (BuildContext context) => ShowData(),
                //   )),
                // ),
              ],
            ),
      ),
    );
  }
}