// class for code optimization

import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart';
import 'package:weather_app/main.dart';

import 'package:flutter/services.dart';

class worker {
  String location = "def";
  String temp = "def";
  String humidity = "def";
  String air_speed = "def";
  String description = "def";

  worker(String Location) {
    this.location = Location;
  }

  // method will give the location
  Future<String> getData() async {
    try {
      Response res = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=165fe5566c4cb4f7a16efa26e0824de5"));
      Map data = jsonDecode(res.body);
      Map main_data = data['main'];
      this.temp = (main_data['temp']).toString();
      this.humidity = (main_data['humidity'].toString());

      List weather_data = data['weather'];
      Map weather_data_zero = weather_data[0];
      this.description = weather_data_zero['description'];

      Map wind_data = data['wind'];
      this.air_speed = (wind_data['speed']).toString();

      this.location = data['name'];

      // dataPrint();
    } catch (error) {
      // this code runs when the error get occured
      temp = "Error Occured";
      humidity = "Error Occured";
      air_speed = "Error Occured";
      description = "Error Occured";
      location = "Invalid Location";
    }

    return "finsihed";
  }

  void dataPrint() {
    print(
        "location $location \ntemp $temp \nhumidity $humidity \nair_speed $air_speed \ndescription $description");
  }
}
