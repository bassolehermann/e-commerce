import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'models/models.dart';
import 'pages/Panier.dart';
import 'pages/Login.dart';
import 'pages/Signup.dart';
import 'pages/HomePage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white
      ),
      home: HomePage(),//MyHomePage(title: 'Cursus NaN'),
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> maListe = [
    Colors.deepPurple.shade900,
    Colors.deepPurple.shade700,
    Colors.deepPurple.shade500,
    Colors.deepPurple.shade300
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            child: Container(
              child: Image.network("https://cdn.pixabay.com/photo/2016/10/26/03/01/gothic-1770548_960_720.jpg",fit: BoxFit.cover,),
            ) ,
          ),
          Container(
            child:Column(
              children: <Widget>[
                SizedBox(height: 60,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 100,
                      child: Stack(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.purple,
                            radius: 40,
                          ),

                          Positioned(
                            right: 2,
                            top: 6,
                            child: CircleAvatar(
                              radius: 33,
                              backgroundColor: Colors.indigo,
                              child: Icon(Icons.shopping_cart, color: Colors.white, size: 30,),
                            ),
                          )
                        ],
                      ),
                    ),

                    Text('Treva Shop', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)

                  ],
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.all(Radius.circular(40))
                  ),
                  height: 70,
                  width: 340,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('F',style: TextStyle(color: Colors.white,fontSize: 40),),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Login With Facebook',style: TextStyle(color: Colors.white,),)
                    ],
                  ),

                ),
                SizedBox(
                  height: 20,
                ),

                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40))
                  ),
                  height: 70,
                  width: 340,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.add_circle_outline),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Login With Google',style: TextStyle(color: Colors.black45,),)
                    ],
                  ),

                ),
                SizedBox(
                  height: 20,
                ),
                Text('OR',style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 20,
                ),

                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(icon: Icon(Icons.email,size: 25,),hintText: "Email",labelStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none
                      ),
                    ),
                  ) ,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(icon: Icon(Icons.vpn_key,size: 25,),hintText: "Password",labelStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none
                      ),
                    ),
                  ) ,
                ),
                SizedBox(height: 20,),
                Center(
                  child: Text('Have Acount?Sign In', style: TextStyle(color: Colors.white),),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom:28.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 60,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          gradient: LinearGradient(
                              colors: maListe,
                              begin:  Alignment.centerLeft,
                              end: Alignment.centerRight)
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Center(
                        child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 22),),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60,),
              ],
            ) ,
          )
        ],
      ),
    );
  }
}
*/
