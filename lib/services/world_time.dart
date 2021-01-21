import 'dart:math';

import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';


class WorldTime{
  String location; // location name for the UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url;  // // location url for api endpoint

  WorldTime({this.location, this.flag, this.url});



  Future<void> getTime() async{

    try{

      Response response = await get('https://www.amdoren.com/api/timezone.php?api_key=IBZzdLmM2yCYaXjgTZ6x&loc=New+York');
      Map data = jsonDecode(response.body); // trả về chuỗi json có thể dùng

      // get properties from data
      String datetime = data['time'];
      int offset =data['offset'];
      // print(data['time']);


      // //     // creat DataTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours:  offset));


      // time = datetime.toString();
      time = DateFormat.jm().format(now);
    }catch(e){
      print("THE ERROR IS : $e" );
      print("The exception is : ${throw e}");
      time = " could not get time data";
    }
  }

}
