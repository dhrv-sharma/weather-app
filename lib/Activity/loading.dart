import 'package:flutter/material.dart';
import 'package:weather_app/worker/worker.dart';

import 'package:flutter/services.dart';

//  for spinning and loading in flutter we use spin kit package in flutter
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loadingactivity extends StatefulWidget {
  const loadingactivity({super.key});

  @override
  State<loadingactivity> createState() => _loadingState();
}

class _loadingState extends State<loadingactivity> {
  String city = "New Delhi";
  String temprature = "loading";
  String humidity = "loading";
  String air_speed = "loading";
  String description = "loading";

  void startApp() async {
    worker instance = worker("$city");
    await instance.getData();

    temprature = instance.temp;
    humidity = instance.humidity;
    air_speed = instance.air_speed;
    description = instance.description;

    // pushReplacementnamed is a special type of fucntion which kills the previous activity and jumped to new activity
    // in argmument we sent the data in form of map
    Navigator.pushReplacementNamed(context, '/homescreen', arguments: {
      "temp": temprature,
      "humidity": humidity,
      "air": air_speed,
      "description": description,
      "location": instance.location,
      "icon": instance.imag
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     // safe area show the the widget in application beyond the mobile bar
  //     // body: SafeArea(child: Text("Loading Activity")),

  //     body: Column(
  //       children: <Widget>[
  //         SafeArea(
  //           // button creation we have mainly three types of buttons in flutter one is TextButton other is Outlined button and third is Elevated button
  //           child: ElevatedButton.icon(
  //             // this function will run when the that button is clicked in flutter you can express fucntion as (){ function body }
  //             onPressed: () {
  //               // Handle button press
  //               // this frunction is used to switch into the new activity
  //               Navigator.pushNamed(context, "/homescreen");
  //             },
  //             icon: const Icon(Icons.add_to_home_screen),
  //             label: const Text("Loading"),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    //  in order to change the color of the status bar use this before this import service.dart in the folder
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue[300],
    ));

    // method to get arguments from the prev sections
    Map? search_text = ModalRoute.of(context)!.settings.arguments as Map;
    if (search_text?.isNotEmpty ?? false) {
      city = search_text["search_city"];
    }
    
    startApp();

    return Scaffold(
      body: Center(
        // center is used to bring the widget at the centre of the app
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "images/logo.png",
                height: 240,
                width: 240,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Weather App",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: 'Roboto'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Made By Dhruv Sharma",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              // always copy this part of code for spin kit package
              // SpinKitRotatingCircle(
              //   color: Colors.white,
              //   size: 50.0,
              // ),

              //  now cut the name after SpinKit and paste the name there
              const SizedBox(
                height: 25,
              ),
              const SpinKitFoldingCube(
                color: Colors.white,
                size: 30.0,
              )
            ]),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
