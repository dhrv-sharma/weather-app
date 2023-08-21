import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/services.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';

// class weatherHome extends StatefulWidget {
//   const weatherHome({super.key});

//   @override
//   State<weatherHome> createState() => _weatherHomeState();
// }

// class _weatherHomeState extends State<weatherHome> {
//   @override
//   Widget build(BuildContext context) {

//     //  for data retrieve we will retrieve here as we need context of the current activity
//     Map info =ModalRoute.of(context)!.settings.arguments as Map; // there we send the data in form of map

//     // here temp and air are the key of the map
//     double getTemp=(double.parse(info['temp']))-273.15 ; //in degree and celsius
//     double getSpeed=(double.parse(info['air']))/0.2777; // in km /hr

//     return  Scaffold(
//       body: SafeArea(child: Text("$getTemp C")),
//     );
//   }
// }

class weatherHome extends StatefulWidget {
  const weatherHome({super.key});

  @override
  State<weatherHome> createState() => _weatherHomeState();
}

class _weatherHomeState extends State<weatherHome> {
  // In Flutter, a TextEditingController is a controller class that's used to manage the text input in text fields, text areas, and other text input widgets. It allows you to control the content of the text input, as well as respond to changes in the input. It's commonly used with widgets like TextField and TextFormField.
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    //  use var as for map
    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    // print("object");
    // print(info["temp"].toString().substring(0,4));
    // print(info["humidity"]);
    // print(info["air"]);
    // print(info["description"]);

    // String temp=(double.parse(["temp"].toString().substring(0,4))-273).toString();
    String temp;
    String air;
    if (info['temp'] != "NA") {
      double temp_doub = (double.parse(info['temp'].toString())) - 273;
       temp = temp_doub.toString().substring(0, 4);
      double getSpeed = (double.parse(info['air'].toString())) / 0.2777;
       air = getSpeed.toString().substring(0, 1);
    }else{
      temp="NA";
      air="-";
      
    }
  

    String humid = info["humidity"].toString();
    String des = info["description"].toString().toUpperCase();
    String loc = info["location"].toString().toUpperCase();

    String img = info['icon'];
    var cit_name = [
      "London",
      "Melbourne",
      "Udupi",
      "Vellore",
      "Lucknow",
      "Manchaster",
      "Tokyo",
      "New York",
      "Beijing",
      "Cape Town"
    ];
    final _random = new Random(); // creating a instance of random
    var city = cit_name[_random.nextInt(cit_name
        .length)]; // using the random instance for generating a number between the mao length and zer

    // status bar color change
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF6DD5FA),
    ));

    return Scaffold(
      body: SafeArea(
          // main container
          // try to make container for the more efficeint padding and margin
          child: Container(
        decoration: const BoxDecoration(
            // for container

            gradient: LinearGradient(
          colors: [
            Color(0xFF6DD5FA), // Light blue
            Color(0xFF2980B9), // Deep blue
          ],
          begin: Alignment.topCenter, // start the gradeint from this side
          end: Alignment.bottomCenter, // end the gradeint from this side
          stops: [0.2, 0.8],
        )),

// A gradient is defined by a list of color stops, where each stop consists of a color and a stop position. The stop position is a value between 0.0 and 1.0 that determines where the color should be fully transitioned to in the gradient.In this case, the gradient starts with the color red at position 0.0 (the beginning of the gradient) and gradually transitions to the color blue with a stop at position 0.7. The remaining part of the gradient from 0.7 to 1.0 will be entirely blue.

// You can use the "stops" attribute to create custom color transitions and achieve various visual effects in your Flutter app's UI elements. The number of stop positions should match the number of colors in the gradient, and they should be in ascending order.

        // LinearGradient(
        //   colors: [Colors.red, Colors.blue],
        //   stops: [0.0, 0.7],
        // )

        // stops: [
        //   0.1, // screen proprtion taken by blue colour 0 -10 %
        //   0.3, // screen proportion  taken by pink color  30 - 70%
        //   0.7 // screen proprtion taken by the green color 70 - 100 %
        // ]

        child: Column(
          children: <Widget>[
            Container(
              // search bar
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(24)),
              padding: const EdgeInsets.symmetric(
                  horizontal:
                      8), // in symetric type of styling either horzizontal or vertically  or both from both sides
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              child: Row(children: <Widget>[
                GestureDetector(
                  // to enable the function on it detects the gesture on its child
                  onTap: () {
                    String search = searchController
                        .text; // getting the searched location from the text field
                    // print(search);
                    if ((search.replaceAll(" ", "")) != "") {
                      // now false click can't be searched
                      Navigator.pushReplacementNamed(context, "/loading",
                          arguments: {"search_city": search});
                    } else {
                      // blank search
                    }
                  },
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                      child: const Icon(
                        Icons.search,
                        color: Colors.blueAccent,
                      )),
                ),
                Expanded(
                  child: TextField(
                    style: const TextStyle(
                        // used to set the style in active search bar
                        fontFamily: AutofillHints.email,
                        fontWeight: FontWeight.w600),
                    controller:
                        searchController, // setting the search controller for the text field
                    // for user string input while using inside the row you have to use expanded so that Text filed takes whole dapce
                    decoration: InputDecoration(
                        border:
                            InputBorder.none, // border decoration of text field
                        hintText: "Search $city", // hint
                        hintStyle: const TextStyle(
                            fontFamily: AutofillHints.email,
                            fontWeight: FontWeight.w600)),
                  ),
                )
              ]),
            ),
            Container(
              // description
              height: 105,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white.withOpacity(
                      0.5) // if you are using decoration then container color should be there in decoration

                  ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 26),
              child: Row(
                children: <Widget>[
                  Image.network(
                    "https://openweathermap.org/img/wn/$img@2x.png",
                    width: 80,
                    height: 90,
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "$des",
                        style: const TextStyle(
                            fontFamily: AutofillHints.transactionAmount,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "In $loc",
                        style: const TextStyle(
                            fontFamily: AutofillHints.transactionAmount,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              // temprature
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white.withOpacity(
                      0.5) // if you are using decoration then container color should be there in decoration

                  ),
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 25),
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(
                        WeatherIcons.wiThermometer,
                        size: 45,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Temprature",
                        style: TextStyle(
                            fontFamily: AutofillHints.transactionAmount,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$temp",
                          style: const TextStyle(
                              fontFamily: AutofillHints.transactionAmount,
                              fontSize: 80,
                              fontWeight: FontWeight.bold)),
                      const Text("C",
                          style: TextStyle(
                              fontFamily: AutofillHints.transactionAmount,
                              fontSize: 30,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
            ),
            Container(
              // humidity
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 25),

              child: Row(
                children: [
                  Container(
                      height: 200,
                      width: 170,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 27, vertical: 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                WeatherIcons.wiRaindrop,
                                color: Colors.blue,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Humidity",
                                  style: TextStyle(
                                      fontFamily:
                                          AutofillHints.transactionAmount,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("$humid",
                                  style: const TextStyle(
                                      fontFamily:
                                          AutofillHints.transactionAmount,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                width: 3,
                              ),
                              const Text("%",
                                  style: TextStyle(
                                      fontFamily:
                                          AutofillHints.transactionAmount,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 200,
                      width: 170,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 27, vertical: 26),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      child: Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(
                                WeatherIcons.wiDayLightWind,
                                color: Colors.green,
                                size: 20,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Wind Speed",
                                  style: TextStyle(
                                      fontFamily:
                                          AutofillHints.transactionAmount,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("$air",
                                  style: const TextStyle(
                                      fontFamily:
                                          AutofillHints.transactionAmount,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                width: 3,
                              ),
                              const Text("km/hr",
                                  style: TextStyle(
                                      fontFamily:
                                          AutofillHints.transactionAmount,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text("Developed By Dhruv Sharma",
                    style: TextStyle(
                        fontFamily: AutofillHints.transactionAmount,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 10,
                ),
                Text("Sourced By Open Weather Api",
                    style: TextStyle(
                        fontFamily: AutofillHints.transactionAmount,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      )),
    );
  }
}
