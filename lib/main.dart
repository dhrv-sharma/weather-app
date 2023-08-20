import 'package:flutter/material.dart';
import 'package:weather_app/Activity/weatherHome.dart';
import 'Activity/home.dart';
import 'Activity/loading.dart';
import 'Activity/chooselocation.dart';
import 'Activity/homeactivity.dart';
import 'package:flutter/services.dart';

// created multiple activity in the activity folder and then we import it from import function
// routes are used for switching the activity in app 

// stateless state doesnot change with time whereas stateful widget change time 
// stateful method have statful class, setstate method used to set state of any widget for eg any image appear init method is called when complete widget is created
//dispose method runs when widget terminated 
//
//  
 void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.blue,
  ));
  
  runApp(MaterialApp(
    routes: {
      // we have to make key value pairs like map
      //  this  / (default routeer for home can also be mention in material app widget in home property)refers to the home activty when mobile application run 
      "/": (context) =>const loadingactivity(),
      //  "/ name for the switching link " : (current activity also known as context  ) => class()
      '/homescreen':(context) =>const  weatherHome() 

    },
    
  ));
  
}

