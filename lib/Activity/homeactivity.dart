// this file tells you how to use api
import 'dart:convert';
// import 'dart:ffi';

import 'package:flutter/material.dart';

// if you want to get data from the third party api then you have to use this package for sure
import 'package:http/http.dart';

class Homeactivtity extends StatefulWidget {
  const Homeactivtity({super.key});

  @override
  State<Homeactivtity> createState() => _HomeactivtityState();
}

class _HomeactivtityState extends State<Homeactivtity> {
// learning data from api
// make this fucntion async

  void getData() async {
    // getdata
    // we get the data from the api in form Of response
    // always have to use wait function

    //  print(res.body);        // printing whole data from the api
    // print(data);             // whole json get print
    // print(data['date']);     // now we can access the atribute of json file using by this method

    // format Response resName=await get(Url);
    Response res = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=Indore&appid=165fe5566c4cb4f7a16efa26e0824de5")); // methhod by http package
    // method jsonDecode(res.body) for decoding json file
    Map data = jsonDecode(res
        .body); // as we know that api data is stored in format of map so we use json file varibale data

    // getting temprature as main json file contains data in format of map 
    Map temp_data =data['main'];
    double temp=temp_data['temp'];
    print(temp);


    // getting description from json file but see it is stored in key value weather and then weather have a list and list item is containg the map 
     List weather=data['weather']; // getting the list from the map 
     Map weather_first=weather[0];// getting the map from list[0]
     String description=weather_first['description']; // getting map key value pair from map which we got from list[0]
     print(description);
  }

  @override
  void initState() {
    print("this is init state");
    super.initState();
    // api call
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text("Home Activity")),
    );
  }
}
