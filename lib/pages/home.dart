import 'package:flutter/material.dart';
import 'package:word_time/services/world_time.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

    // Map data ;
    // Map data = ModalRoute.of(_HomeState).settings.arguments; //
  @override
  Widget build(BuildContext context) {
   // data = ModalRoute.of(context).settings.arguments; // nhận data từ loading route

    Map data = ModalRoute.of(context).settings.arguments; //
    print(data);
    return Scaffold(
      body:SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/flag_vietnam.png'),
                  fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: (){
                        Navigator.pushNamed(context, '/location');
                      },
                      icon: Icon(Icons.edit_location)
                      , label:  Text("Home edit locaation")),
                  SizedBox(height: 10.0),

                  Text(data['location'] ?? "ahiho",
                    style: TextStyle(

                         fontSize: 30
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[

                      SizedBox(height: 10.0,),
                      Text(data['time'] ?? 'hihi',
                        style: TextStyle(
                          fontSize: 50
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );

  }
}
