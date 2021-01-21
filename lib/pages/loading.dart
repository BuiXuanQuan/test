import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_time/services/world_time.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  WorldTime worldTime;
  String time1 = ' loading';
  void getData() async {
    //Future code
    //  // simulate networt request for a username of boyfriend
    //  // await meaning : wait for finish before we start the nextline
    //  String nameBoyfriend = await Future.delayed(Duration(seconds: 3),(){
    //     return 'quan dep trai';
    //  });
    //  // simulate networt request for a username of girlfriend
    //  String nameGirlfriend = await Future.delayed(Duration(seconds: 2),(){
    //    return 'quynh xinh gai ';
    //  });
    // print('$nameBoyfriend - $nameGirlfriend');
    //   Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
    //   Map data = jsonDecode(response.body); // trả về chuỗi json có thể dùng
    //   print(data);
    //   print("userId: ${data['userId']}");
  }

  void getEmail() async {
    // make the request
    Response response =
        await get('https://jsonplaceholder.typicode.com/comments');
    List data = jsonDecode(response.body);

    //get properties fromdata
    // print(data);
    print(" list one is ${data[1]}");
    Map newData = data[1];
    print('email : ${newData['email']}');
    print(" slala $response");
  }

  void setupWorldTime() async {
    worldTime = new WorldTime(
        location: 'Hanoi', flag: 'flag_vietnam.png', url: 'est/now');
    await worldTime.getTime();
    // print(worldTime.time);
    // setState(() {
    //   time1 = worldTime.time;
    // });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
    });
  }

  @override
  void initState() {
    super.initState();
    // getData();
    getEmail();
    setupWorldTime();
    print('hey threre');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
